class LikesController < ApplicationController
  def create
    @sellitem = Sellitem.find(params[:sell_id])
    @like = Like.create(user_id: current_user.id, sellitem_id: params[:sell_id])
    @likes_count = @sellitem.likes.length
  end

  def destroy
    @sellitem = Sellitem.find(params[:sell_id])
    @like = Like.find_by(sellitem_id: params[:sell_id], user_id: current_user.id)
    @like.destroy
    @likes_count = @sellitem.likes.length
  end
end
