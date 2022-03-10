class HomesController < ApplicationController
  before_action :set_home, only: %i[show edit update destroy]

  def index
    @q = Home.ransack(params[:q])
    @homes = @q.result(distinct: true).includes(:rooms,
                                                :furniture_items).page(params[:page]).per(10)
  end

  def show
    @room = Room.new
  end

  def new
    @home = Home.new
  end

  def edit; end

  def create
    @home = Home.new(home_params)

    if @home.save
      redirect_to @home, notice: "Home was successfully created."
    else
      render :new
    end
  end

  def update
    if @home.update(home_params)
      redirect_to @home, notice: "Home was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @home.destroy
    redirect_to homes_url, notice: "Home was successfully destroyed."
  end

  private

  def set_home
    @home = Home.find(params[:id])
  end

  def home_params
    params.require(:home).permit(:user_id, :home_name, :home_owner)
  end
end
