class ProductsController < ApplicationController

  def index
    @ladies = Sellitem.includes(:images).where(category_id: [*1..137]).order("created_at DESC").limit(10)
    @mens= Sellitem.includes(:images).where(category_id: [*138..360]).order("created_at DESC").limit(10)
    @appliances = Sellitem.includes(:images).where(category_id: [*360..775]).order("created_at DESC").limit(10)
    @toys = Sellitem.includes(:images).where(category_id: [*776..1000]).order("created_at DESC").limit(10)

    @parents = Category.roots.order("id ASC").limit(13)
  end

  def category
    @ladies = Sellitem.includes(:images).where(category_id: [*1..137]).order("created_at DESC").limit(10)
    @mens= Sellitem.includes(:images).where(category_id: [*138..360]).order("created_at DESC").limit(10)
    @appliances = Sellitem.includes(:images).where(category_id: [*360..775]).order("created_at DESC").limit(10)
    @toys = Sellitem.includes(:images).where(category_id: [*776..1000]).order("created_at DESC").limit(10)
    @parents = Category.roots.order("id ASC").limit(13)
    @categories = Category.roots.find_by(id: params[:id])
    
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

end
