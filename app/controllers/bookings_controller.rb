class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @room = Room.find(params[:room_id])
    @booking.room = @room

    if @booking.save
      redirect_to room_path(@room)
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
    @bookings = Booking.all
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
