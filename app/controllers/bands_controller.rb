class BandsController < ApplicationController
  before_action :set_band, only: %i[show edit update destroy]

  def show
    @band_social = BandSocial.new
    @socials = BandSocial.where(band_id: @band.id)
    @gig = Gig.new
    @gigs = Gig.where(band_id: @band.id)
    @booking = Booking.where(band_id: @band.id)
    @band_member = BandMember.new
    @band_members = @band.band_members
  end

  def new
    @band = current_user.bands.new
    authorize @band
  end

  def create
    @band = Band.new(band_params)
    authorize @band

    if @band.save
      @band_member = BandMember.create(user_id: current_user.id, band_id: @band.id)
      redirect_to band_path(@band)
    else
      render :new
    end
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
