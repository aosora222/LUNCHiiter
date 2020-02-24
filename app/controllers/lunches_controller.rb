class LunchesController < ApplicationController
  def index
  end

  def new
    @lunch = Lunch.new
    # @lunch.images.new
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
    params.require(:item).permit(:name, :price, :status, :category_id, :brand, :cost, :delivery, :send_address, :send_date, :condition, images_attributes: [:src, :_destroy, :id]).merge(seller_id: current_user.id)
  end
end
