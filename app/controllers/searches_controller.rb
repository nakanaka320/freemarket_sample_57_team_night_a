class SearchesController < ApplicationController

  def index
    @sellitems = Sellitem.search(params[:search]).limit(132)
    @search = params[:search]
  end

end
