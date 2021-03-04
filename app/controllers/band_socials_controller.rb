class BandSocialsController < ApplicationController
  def destroy
    @band_social = BandSocial.find(params[:id])
    @band = @band_social.band
    authorize @band
    @band_social.destroy
    redirect_to band_path(@band)
  end

  def create
    @band_social = BandSocial.new(band_socials_params)
    @band = Band.find(params[:band_id])
    @band_social.band = @band

    authorize @band
    if @band_social.save
      redirect_to band_path(@band)
    else
      render 'bands/show'
    end
  end

  private

  def band_socials_params
    params.require(:band_social).permit(:social_type, :profile_url)
  end
end
