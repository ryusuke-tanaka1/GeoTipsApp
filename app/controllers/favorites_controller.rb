class FavoritesController < ApplicationController
  before_action :set_tip

  def create
    @favorite = Favorite.create(user_id: current_user.id, tip_id: @tip.id)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, tip_id: @tip.id)
    @favorite.destroy
  end

  private
  def set_tip
    @tip = Tip.find(params[:id])
  end
end
