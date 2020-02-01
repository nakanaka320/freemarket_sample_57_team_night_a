class CategoryController < ApplicationController
  def new
    @parents = Category.all.order("id ASC").limit(13)
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:productcategory]).children
  end

  # def category
  #   @categories = Category.includes(children: :children).find_by(id: params[:id])
  #   category_id = @categories.children.map(&:children).flatten
  #   category_id.collect!{|category| category[:id]}
  #   @products = Sellitem.includes(:images).where(category: category_id).order("created_at DESC").limit(10)
  # end

  # def category2
  #   @categories = Category.includes(:children).find_by(id: params[:id])
  #   category_id = @categories.children.map {|category| category["id"]}
  #   @products = Sellitem.includes(:images).where(category: category_id).order("created_at DESC").limit(10)
  # end

  # def category3
  #   @categories = Category.find_by(id: params[:id]).children
  # end
end
