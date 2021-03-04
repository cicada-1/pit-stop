class BandMembersController < ApplicationController
  def destroy
  end

  def create
    @band_member = BandMember.new(band_member_params)
    @band = Band.find(params[:band_id])
    @band_member.band = @band

    authorize @band
    if @band_member.save
      redirect_to band_path(@band)
    else
      render 'bands/show'
    end
  end

  private

  def band_member_params
    params.require(:band_member).permit(:user_id, :profile_url)
  end
end
