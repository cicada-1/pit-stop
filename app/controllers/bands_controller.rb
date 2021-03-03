class BandsController < ApplicationController
  before_action :set_band, only: %i[show edit update destroy]

  def show
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
  end

  def destroy
  end

  private

  def set_band
    @band = Band.find(params[:id])
    authorize @band
  end

  def band_params
    params.require(:band).permit(:name, :location, :descripyion, :number_of_members)
  end
end
