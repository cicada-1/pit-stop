class ReviewsController < ApplicationController
  def create
    if params[:room_id]
      @room = Room.find(params[:room_id])
      @band = Band.where("name ILIKE ?", "%#{params[:band]}%").select { |element| element.band_members.find_by(user_id: current_user.id) }[0]
      @review = RoomSocial.new(review_params.merge(room_id: @room.id, band_id: @band.id))
      authorize @room
      authorize @band
      if @review.save
        redirect_to room_path(@room), notice: "Your review has been added!"
      else
        render "rooms/show"
      end
    else

  end

  def update
  end

  def destroy
  end
end
