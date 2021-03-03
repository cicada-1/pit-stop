class RoomsController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy]
  def new
    @room = current_user.rooms.new
    authorize @room
  end

  def create
    @room = current_user.rooms.new(room_params)
    authorize @room
  end

  def index
    @rooms = policy_scope(Room)
  end

  def show
  end

  def edit
  end

  def update
    @room.update(room_params)
    redirect_to room_path(@room)
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private

  def set_room
    @room = Room.find(params[:id])
    authorize @room
  end

  def room_params
    params.require(:room).permit(:name, :address, :description, :capacity, :parking, :bio, :user_id)
  end
end
