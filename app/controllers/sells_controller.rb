class SellsController < ApplicationController
  before_action :authenticate_user!
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
    redirect_to root_path,notice: "#{@sellitem.name}を出品しました"
    else
      @parents = Category.roots
      render :new
    end
  end

  def show
    @sellitem = Sellitem.find(params[:id])
  end

  def edit
    @sellitem = Sellitem.find(params[:id])
    @parents = Category.roots
  end

  def update
    if  params[:sellitem][:images_attributes] == nil
      @sellitem.update(update_no_image_params)
      redirect_to action: :show
    else
      if @sellitem.update(sellitem_update_params)
        redirect_to action: :show
      else
        redirect_to action: :edit
      end
    end
  end
    

  def destroy
    @sellitem.destroy if @sellitem.user_id == current_user.id
    redirect_to action: :delete
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
                                     images_attributes: [:gazou, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_sellitem
    @sellitem = Sellitem.find(params[:id])
  end

  def update_no_image_params
    params.require(:sellitem).permit(:name, :text, :category_id, :price, :condition , :send_place, :send_method, :send_day, :send_cost).merge(user_id: current_user.id)
  end

  def sellitem_update_params
    params.require(:sellitem).permit(:name, :text, :category_id, :price, :condition , :send_place, :send_method, :send_day, :send_cost).merge(user_id: current_user.id)
  end

end

