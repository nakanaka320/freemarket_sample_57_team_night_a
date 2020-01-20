class ProductsController < ApplicationController
  def index
    @image = Image.gazou
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
