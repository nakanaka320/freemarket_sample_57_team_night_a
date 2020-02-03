class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: current_user.id, sellitem_id: params[:sell_id])
    @like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(sellitem_id: params[:sell_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
