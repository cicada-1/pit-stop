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
    @booking = policy_scope(Booking).find(params[:id])
    authorize @booking
    room = @booking.room
    @booking.destroy
    redirect_to bookings_path
  end

  def index
    @bookings = policy_scope(Booking).where(band_id: current_user.bands.ids).order(:start_date)
    @future_bookings = @bookings.where("end_date >= ?", Date.today).order(:start_date)
    @past_bookings = @bookings.where("end_date < ?", Date.today).where(confirmation: true).order(:start_date).reverse.first(5)
    # raise
    authorize @bookings
  end

  def requests
    @booking_requests = policy_scope(Booking).where(room_id: current_user.room_ids)
    @future_booking_requests = @booking_requests.where("end_date >= ?", Date.today).order(:start_date)
    @past_booking_requests = @booking_requests.where("end_date < ?", Date.today).where(confirmation: true).order(:start_date).reverse.first(5)
    authorize @booking_requests
  end

  def confirm
    @booking = Booking.find(params[:id])
    @booking.confirmation = true
    authorize @booking
    @booking.save
    redirect_to bookings_requests_path
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.confirmation = false
    authorize @booking
    @booking.save
    redirect_to bookings_requests_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :band_name)
  end
end
