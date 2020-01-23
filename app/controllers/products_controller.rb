class ProductsController < ApplicationController

  def index
    @sellitem = Sellitem.includes(:images).where(category: 1..137).order("created_at DESC").limit(10)
    # @image = @sellitem.images.first
    # binding.pry
    # @sellitem[0].images[0].gazou.file.file
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

  # def sell
  # end
  
# 039c56833f0cf7314efc65a89f6e067872d073f4
end
