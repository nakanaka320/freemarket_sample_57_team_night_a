class SearchesController < ApplicationController

  def index
    @sellitems = Sellitem.search(params[:search]).limit(132)
    @search = params[:search]
    @parents = Category.all.order("id ASC").limit(13)
  end

  def new
    @parents = Category.all.order("id ASC").limit(13)
  end

end
