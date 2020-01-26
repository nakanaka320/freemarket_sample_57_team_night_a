class SellsController < ApplicationController
  before_action :set_sellitem, only:[:show,:edit,:destroy,:update]

  def index

  end
  
  def delete
  end
  
  def new
    @sellitem = Sellitem.new
    @sellitem.images.build
    @parents = Category.roots
  end

  def create
    @sellitem = Sellitem.new(sellitem_params)
    if @sellitem.save
    redirect_to root_path
    else
      @parents = Category.roots
      render :new
    end
  end

  def show
    @sellitem = Sellitem.find(params[:id])
  end

  def edit

  end

  def category_children  
    @category_children = Category.find(params[:productcategory]).children 
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:productcategory]).children
  end

  private
  
  def sellitem_params
    params.require(:sellitem).permit(:name,
                                     :text,
                                     :category_id,
                                     :price,
                                     :condition,
                                     :send_cost,
                                     :send_method, 
                                     :send_place, 
                                     :send_day, 
                                     images_attributes: [:gazou, :_destroy, :id])#, :user_id)
  end

  def set_sellitem
    @sellitem = Sellitem.find(params[:id])
  end

end