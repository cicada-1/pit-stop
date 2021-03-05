class RoomReviewsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @band = Band.where("name ILIKE ?", "%#{params["room_review"]["band_name"]}%").select { |element| element.band_members.find_by(user_id: current_user.id) }[0]
    @room_review = RoomReview.new(room_review_params.merge(room_id: @room.id, band_id: @band.id))
    authorize @room
    authorize @band
    if @room_review.save
      redirect_to room_path(@room), notice: "Your review has been added!"
    else
      render "rooms/show"
    end
  end

  def update
  end

  def destroy
    @room_review = RoomReview.find(params[:id])
    @room = @room_review.room
    @band = @room_review.band
    authorize @band
    @room_review.destroy
    redirect_to room_path(@room), notice: "Your review has been deleted."
  end

  private

  def room_review_params
    params.require(:room_review).permit(:content, :band_name)
  end
end
