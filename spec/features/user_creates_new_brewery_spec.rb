require 'rails_helper'

RSpec.feature "User creates a new brewery" do
  context "User passes valid data" do
    scenario "User is returned to brewery page" do
      visit breweries_path
      name = "Cisco Brewing Co."
      location = "Nantucket, MA"
      click_on "New Brewery"
      fill_in "Name", with: name
      fill_in "Location", with: location
      click_on "Create Brewery"

      expect(page).to have_content "Cisco Brewing Co."
      expect(page).to have_content "Nantucket, MA"
      expect(current_path).to eq brewery_path(Brewery.find_by(name: name))
    end
  end

  context "the submitted data is invalid" do
    scenario "they see an error message" do
      name = "Cisco Brewing Co."

      visit breweries_path
      click_on "New Brewery"
      fill_in "Name", with: name
      click_on "Create Brewery"

      expect(page).to have_content "Location can't be blank"
    end
  end
end
