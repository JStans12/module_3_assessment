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

  it "items destroy" do
    i = Item.create(name: "j", description: "k", image_url: "l")
    j = Item.create(name: "m", description: "n", image_url: "o")

    delete :destroy, id: i.id

    expect(Item.count).to eq(1)
    expect(Item.all).to_not include(i)
  end

  it "items create" do

    post :create, name: "j", description: "k", image_url: "l"

    expect(Item.count).to eq(1)
    expect(Item.first.name).to eq("j")
  end
end
