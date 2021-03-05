class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  
  before_action :set_room, only: %i[show edit update destroy]

  def new
    @room = current_user.rooms.new
    authorize @room
  end

  def create
    @room = current_user.rooms.new(room_params)
    authorize @room
    if @room.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def index
    if params[:query].present?
      @rooms = policy_scope(Room).near(params[:query])
      # @rooms = policy_scope(Room).where("address ILIKE ?", "%#{params[:query]}%")
    else
      @rooms = policy_scope(Room)
    end

    @markers = @rooms.geocoded.map do |room|
      {
        lat: room.latitude,
        lng: room.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { room: room })
      }
    end
  end

  def show
    @room_social = RoomSocial.new
    @room_socials = RoomSocial.where(room_id: @room.id)
    @room_review = RoomReview.new
    @room_reviews = RoomReview.where(room_id: @room.id)
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to room_path(@room)
    else
      render :edit
    end
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
    params.require(:room).permit(:name, :country, :city, :postcode, :description, :capacity, :parking, :bio, :user_id)
  end
end
