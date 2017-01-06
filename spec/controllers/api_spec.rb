require 'rails_helper'

describe Api::V1::ItemsController do
  it "items index" do
    item = Item.create(name: "j", description: "k", image_url: "l")
    item = Item.create(name: "m", description: "n", image_url: "o")
    item = Item.create(name: "p", description: "q", image_url: "r")

    get :index
    items = JSON.parse(response.body, symbolize_names: true)
    item = items.first

    expect(items.length).to eq(3)
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:image_url)
  end

  it "items show" do
    i = Item.create(name: "j", description: "k", image_url: "l")

    get :show, id: i.id
    item = JSON.parse(response.body, symbolize_names: true)

    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:image_url)
  end
end
