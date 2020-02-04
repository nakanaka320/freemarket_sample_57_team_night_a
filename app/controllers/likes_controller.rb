class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @sellitem = Sellitem.find(params[:sell_id])
    @like = current_user.likes.build(user_id: current_user.id, sellitem_id: params[:sell_id])
    if @like.save
    else
      flash.now[:alert] = like.errors.full_messages
    end
    @likes_count = @sellitem.likes.length
  end

  def destroy
    @sellitem = Sellitem.find(params[:sell_id])
    @like = Like.find_by(sellitem_id: params[:sell_id], user_id: current_user.id)
    if @like.destroy
    else
      flash.now[:alert] = '削除できませんでした。'
    end
    @likes_count = @sellitem.likes.length
  end
end
