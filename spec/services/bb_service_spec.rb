require 'rails_helper'

describe BbService do
  it "#get_stores" do

    stores = BbService.get_stores
    store = stores.first

    expect(stores.length).to eq(16)
    expect(store).to have_key(:storeType)
    expect(store).to have_key(:longName)
    expect(store).to have_key(:city)
    expect(store).to have_key(:address)
  end
end
