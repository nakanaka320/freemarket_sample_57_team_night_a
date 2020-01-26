class ProductsController < ApplicationController

  def index
    @ladies = Sellitem.includes(:images).where(category_id: [*1..137]).order("created_at DESC").limit(10)
    @mens= Sellitem.includes(:images).where(category_id: [*138..360]).order("created_at DESC").limit(10)
    @appliances = Sellitem.includes(:images).where(category_id: [*360..775]).order("created_at DESC").limit(10)
    @toys = Sellitem.includes(:images).where(category_id: [*776..1000]).order("created_at DESC").limit(10)
  end

  def new
  end

  def show
  end

  def detail
  end

  def edit
    @user = current_user
  end

  
  
# 039c56833f0cf7314efc65a89f6e067872d073f4
end
