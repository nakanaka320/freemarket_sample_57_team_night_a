class CategoryController < ApplicationController
  def new
    @parents = Category.all.order("id ASC").limit(13)
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:productcategory]).children
    end
end
