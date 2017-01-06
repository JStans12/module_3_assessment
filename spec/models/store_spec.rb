require 'rails_helper'

describe Store do
  it ".by_zip" do

    response = Store.by_zip(80202)
    stores = response[1]
    store = stores.first

    expect(response[0]).to eq(16)
    expect(stores.length).to eq(15)
    expect(store).to respond_to(:store_type)
    expect(store).to respond_to(:long_name)
    expect(store).to respond_to(:city)
    expect(store).to respond_to(:state)
    expect(store).to respond_to(:phone)
    expect(store).to respond_to(:distance)
  end
end
