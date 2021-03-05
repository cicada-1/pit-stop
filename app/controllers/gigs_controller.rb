class GigsController < ApplicationController
  def update
  end

  def create
    @band_gig = Gig.new(gig_params)
    @band = Band.find(params[:band_id])
    @band_gig.band = @band

    authorize @band
    if @band_gig.save
      redirect_to band_path(@band)
    else
      render 'bands/show'
    end
  end

  def destroy
    @band_gig = Gig.find(params[:id])
    @band = @band_gig.band
    authorize @band
    @band_gig.destroy
    redirect_to band_path(@band)
  end

  private

  def gig_params
    params.require(:gig).permit(:date, :location)
  end
end
