class BandReviewsController < ApplicationController
  def create
    @band = Band.find(params[:band_id])
    @room = Room.where(user_id: current_user.id)
    @band_review = BandReview.new(band_review_params.merge(room_id: @room.id, band_id: @band.id, review_type: "band"))
    authorize @room
    authorize @band
    if @review.save
      redirect_to band_path(@band), notice: "Your review has been added!"
    else
      render "bands/show"
    end
  end

  def update
  end

  def destroy
  end

  private

  def band_review_params
    params.require(:band_review).permit(:content)
  end
end
