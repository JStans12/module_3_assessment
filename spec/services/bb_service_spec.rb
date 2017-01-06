require 'rails_helper'

describe BbService do
  it "#get_stores" do

    response = BbService.get_stores(80202)
    stores = response[:stores]
    store = stores.first

    expect(response[:total]).to eq(16)
    expect(stores.length).to eq(15)
    expect(store).to have_key(:storeType)
    expect(store).to have_key(:longName)
    expect(store).to have_key(:city)
    expect(store).to have_key(:region)
    expect(store).to have_key(:phone)
    expect(store).to have_key(:distance)
  end

  it "#by_id" do

    store = BbService.by_id(2387)

    expect(store).to have_key(:storeType)
    expect(store).to have_key(:longName)
    expect(store).to have_key(:city)
    expect(store).to have_key(:region)
    expect(store).to have_key(:phone)
    expect(store).to have_key(:hours)
    expect(store).to have_key(:address)
  end
end
