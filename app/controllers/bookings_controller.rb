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
    # @booking = Booking.where(band_id: current_user.)
    # @bookings = policy_scope(Booking)
    #  @room = current_user.rooms.new(room_params)
    #  authorize @room

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
