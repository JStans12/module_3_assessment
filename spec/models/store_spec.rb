require 'rails_helper'

describe Store do
  it ".by_zip" do

    response = Store.by_zip(80202)
    stores = response[1]
    store = stores.first

    expect(response[0]).to eq(16)
    expect(stores.length).to eq(15)
  end
end
