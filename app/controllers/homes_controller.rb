class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]

  # GET /homes
  def index
    @homes = Home.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@homes.where.not(:home_address_latitude => nil)) do |home, marker|
      marker.lat home.home_address_latitude
      marker.lng home.home_address_longitude
      marker.infowindow "<h5><a href='/homes/#{home.id}'>#{home.user_id}</a></h5><small>#{home.home_address_formatted_address}</small>"
    end
  end

  # GET /homes/1
  def show
    @room = Room.new
  end

  # GET /homes/new
  def new
    @home = Home.new
  end

  # GET /homes/1/edit
  def edit
  end

  # POST /homes
  def create
    @home = Home.new(home_params)

    if @home.save
      redirect_to @home, notice: 'Home was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /homes/1
  def update
    if @home.update(home_params)
      redirect_to @home, notice: 'Home was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /homes/1
  def destroy
    @home.destroy
    redirect_to homes_url, notice: 'Home was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def home_params
      params.require(:home).permit(:user_id, :home_address, :home_image)
    end
end
