class Api::V1::ItemsController < ApplicationController

  def index
    items = Item.all
    render json: items, Serializer: ItemSerializer
  end
end
