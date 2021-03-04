class BandsController < ApplicationController
  before_action :set_band, only: %i[show edit update destroy]

  def show
    @socials = BandSocial.where(band_id: @band.id)
    @gig = Gig.where(band_id: @band.id)
    @booking = Booking.where(band_id: @band.id)
  end

  def new
    @band = current_user.bands.new
    authorize @band
  end

  def create
    @band = current_user.band.new(band_params)
    authorize @band
  end

  def edit
  end

  def update
    @band.update(band_params)
  end

  def destroy
    @band.destroy
  end

  private

  def set_band
    @band = Band.find(params[:id])
    authorize @band
  end

  def band_params
    params.require(:band).permit(:name, :location, :description, :number_of_members, :photos)
  end
end
