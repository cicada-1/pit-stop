class BookingsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @band = Band.find_by(id: params["booking"]["band_name"])
    @booking = Booking.new(booking_params.merge(room_id: @room.id, band_id: @band.id))
    authorize @room
    authorize @band
    if @booking.save
      redirect_to bookings_path, notice: "New booking requested!"
    else
      render "rooms/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    room = @booking.room
    @booking.destroy
    redirect_to room_path(room)
  end

  def index
    @bookings = policy_scope(Booking).where(band_id: current_user.bands.ids)
    @booking_requests = policy_scope(Booking).where(room_id: current_user.room_ids)
    authorize @bookings
    authorize @booking_requests
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :band_name)
  end
end
