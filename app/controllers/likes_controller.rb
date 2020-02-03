class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: current_user.id, sellitem_id: params[:sell_id])
    @like.save
  end

  def destroy
    @like = Like.find_by(sellitem_id: params[:sell_id], user_id: current_user.id)
    @like.destroy
  end
end
