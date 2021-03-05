class BandReviewsController < ApplicationController
  def create
    @band = Band.find(params[:band_id])
    @room = Room.where(user_id: current_user.id)[0]
    @band_review = BandReview.new(band_review_params.merge(room_id: @room.id, band_id: @band.id))
    authorize @room
    authorize @band
    if @band_review.save
      redirect_to band_path(@band), notice: "Your review has been added!"
    else
      render "bands/show"
    end
  end

  def update
  end

  def destroy
    @band_review = BandReview.find(params[:id])
    @room = @band_review.room
    @band = @band_review.band
    authorize @room
    @band_review.destroy
    redirect_to band_path(@band), notice: "Your review has been deleted."
  end

  private

  def band_review_params
    params.require(:band_review).permit(:content)
  end
end
