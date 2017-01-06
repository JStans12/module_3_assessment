class Api::V1::ItemsController < ApplicationController

  def index
    items = Item.all
    render json: items, Serializer: ItemSerializer
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy!
      render json: "Item #{params[:id]} will not bother you anymore...", status: 240
    end
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item
    end
  end

  private

    def item_params
      params.permit(:name, :description, :image_url)
    end
end
