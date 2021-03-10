class ChatroomsController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def show
    @chatrooms = Chatroom.where(room_id: current_user.room_ids).or(Chatroom.where(user_id: current_user.id))
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
    if @chatroom.room.user == current_user
      @chatroom_name = @chatroom.user.stage_name
    else
      @chatroom_name = @chatroom.room.user.stage_name
    end
  end

  def create
    @chatroom = Chatroom.new
    @room = Room.find(params[:format])
    @chatroom.name = @room.user.stage_name + current_user.stage_name
    unless Chatroom.find_by(name: @chatroom.name).nil?
      chatroom = Chatroom.find_by(name: @chatroom.name)
      redirect_to chatroom_path(@chatroom)
    else
      @chatroom.user = current_user
      @chatroom.room = @room
      if @chatroom.save
        redirect_to chatroom_path(@chatroom)
      end
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
