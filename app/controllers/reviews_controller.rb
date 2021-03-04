class ReviewsController < ApplicationController
  def create
    if params[:room_id]
      @room = Room.find(params[:room_id])
      @band = Band.where("name ILIKE ?", "%#{params[:band_name]}%").select { |element| element.band_members.find_by(user_id: current_user.id) }[0]
      @review = RoomSocial.new(review_params.merge(room_id: @room.id, band_id: @band.id))
      authorize @room
      authorize @band
      if @review.save
        redirect_to room_path(@room), notice: "Your review has been added!"
      else
        render "rooms/show"
      end
    else
      @band = Band.find(params[:band_id])
      @room = Room.where(user_id: current_user.id)
      @review = RoomSocial.new(review_params.merge(room_id: @room.id, band_id: @band.id, review_type: "band"))
      authorize @room
      authorize @band
      if @review.save
        redirect_to band_path(@band), notice: "Your review has been added!"
      else
        render "bands/show"
      end
    end
  end

  def update
  end

  def destroy
  end

  private

  def review_params

  end
end
