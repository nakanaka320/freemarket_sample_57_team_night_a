class ProductsController < ApplicationController
  def index
    session[:password].clear
    session[:password_confirmation].clear
  end

  def new
  end

  # def sell
  # end
end
