class LunchesController < ApplicationController
  before_action :set_lunch, only: [:edit, :update, :show, :destroy]

  def index
    @lunches = Lunch.includes(:images).all.limit(3).order(updated_at: :desc)
  end

  def new
    @lunch = Lunch.new
    @lunch.images.new
  end

  def create
    @lunch = Lunch.new(lunch_params)
    if @lunch.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show

    @images = @lunch.images
  end

  def edit
  end

  def update
    if @lunch.update(lunch_params)
      redirect_to lunch_path(@lunch.id)
    else
      redirect_to edit_item_path(@lunch.id)
    end
  end

  def destroy
    @lunch.destroy
    redirect_to root_path
  end

  def confirm
    @lunch = Lunch.find(params[:format])
  end


  private
  def lunch_params
    params.require(:lunch).permit(:name, :main, :tel, :addless, :parking, :business_day, :business_time, :holiday, :budget, :hp, :remarks, images_attributes: [:src, :_destroy, :id])
  end

  def set_lunch
    @lunch = Lunch.find(params[:id])
  end
end
