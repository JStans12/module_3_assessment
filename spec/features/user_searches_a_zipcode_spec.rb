require 'rails_helper'

describe "user navigates to root" do
  context "user searches for a zipcode" do
    it "returns a list of 15 stores from that zipcode" do

      visit '/'
      fill_in "search", with: "80202"
      click_on "Search"

      expect(page).to have_content("Total stores: 16")
      expect(page).to have_content("Long Name: Best Buy Mobile - Cherry Creek Shopping Center")
      expect(page).to have_content("City: Denver")
      expect(page).to have_content("State: CO")
      expect(page).to have_content("Phone: 303-270-9189")
      expect(page).to have_content("Store Type: Mobile")
      expect(page).to have_content("Distance: 3.25")
    end
  end
end
