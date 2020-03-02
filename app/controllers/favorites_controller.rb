class FavoritesController < ApplicationController


  def create
    @lunch = Lunch.find(params[:lunch_id])
    unless @lunch.iine?(current_user)
      @lunch.iine(current_user)
      @lunch.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @lunch = Favorite.find(params[:id]).lunch
    if @lunch.iine?(current_user)
      @lunch.uniine(current_user)
      @lunch.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
