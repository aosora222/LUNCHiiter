class LunchesController < ApplicationController
  def index
  end

  def new
    @lunch = Lunch.new
    @lunch.images.new
  end

end
