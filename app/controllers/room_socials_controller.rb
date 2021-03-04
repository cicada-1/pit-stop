class RoomSocialsController < ApplicationController
  def create
    @room = current_user.rooms.new
    authorize @room
    @room_social = RoomSocial.new(room_social_params.merge(room_id: @room.id))
    if @room_social.save
      redirect_to room_path(@room), notice: "#{@room_social.social_type} url has been added!"
    else
      render "rooms/show"
    end
  end

  def destroy
  end
end
