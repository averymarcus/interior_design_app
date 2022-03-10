class FurnituresController < ApplicationController
  before_action :set_furniture, only: %i[show edit update destroy]

  def index
    @q = Furniture.ransack(params[:q])
    @furnitures = @q.result(distinct: true).includes(:room, :comments,
                                                     :likes, :design, :home).page(params[:page]).per(10)
  end

  def show
    @like = Like.new
    @comment = Comment.new
  end

  def new
    @furniture = Furniture.new
  end

  def edit; end

  def create
    @furniture = Furniture.new(furniture_params)

    if @furniture.save
      message = "Furniture was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @furniture, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @furniture.update(furniture_params)
      redirect_to @furniture, notice: "Furniture was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @furniture.destroy
    message = "Furniture was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to furnitures_url, notice: message
    end
  end

  private

  def set_furniture
    @furniture = Furniture.find(params[:id])
  end

  def furniture_params
    params.require(:furniture).permit(:room_id, :image)
  end
end
