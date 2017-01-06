require 'rails_helper'

describe "user searchs for a zipcode" do
  context "user clicks a store link" do
    it "user sees info including hours for that store" do

      visit '/'
      fill_in "search", with: "80202"
      click_on "Search"
      click_on "Best Buy Mobile - Cherry Creek Shopping Center"

      expect(page).to have_content("Long Name: Best Buy Mobile - Cherry Creek Shopping Center")
      expect(page).to have_content("City: Denver")
      expect(page).to have_content("State: CO")
      expect(page).to have_content("Phone: 303-270-9189")
      expect(page).to have_content("Store Type: Mobile")
      expect(page).to have_content("Address: 3000 East First Ave")
    end
  end
end
