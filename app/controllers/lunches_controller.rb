class LunchesController < ApplicationController
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

  private
  def lunch_params
    params.require(:lunch).permit(:name, :main, :tel, :addless, :parking, :business_day, :business_time, :holiday, :budget, :hp, :remarks, images_attributes: [:src, :_destroy, :id])
  end
end
