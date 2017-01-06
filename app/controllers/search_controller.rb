class SearchController < ApplicationController

  def index
    data = Store.by_zip(params[:search].to_i)
    @total = data[0]
    @stores = data[1]
  end

  def show
    @store = Store.by_id(params[:store_id])
  end
end
