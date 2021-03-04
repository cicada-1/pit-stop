class RoomSocialsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @room_social = RoomSocial.new(room_social_params.merge(room_id: @room.id))
    authorize @room
    if @room_social.save
      redirect_to room_path(@room), notice: "#{@room_social.social_type} url has been added!"
    else
      render "rooms/show"
    end
  end

  def destroy
    @room_social = RoomSocial.find(params[:id])
    @room = @room_social.room
    authorize @room
    @room_social.destroy
    redirect_to room_path(@room), notice: "#{@room_social.social_type} url has been deleted."
  end

  private

  def room_social_params
    params.require(:room_social).permit(:social_type, :profile_url, :room_id)
  end  
end
