require 'rails_helper'

RSpec.feature "Admin edits a brewery" do
  context "only an admin can edit" do
    scenario "they see the page with the form to edit the brewery's info" do
    brewery = Brewery.create(name: "Cisco Brewing Co.", location: "Nantucket, Mass")
    visit admin_brewery_path(brewery)
    new_location = "Nantucket, MA"

    click_on "Edit Brewery"

    expect(current_path).to eq "admin/breweries/#{brewery.id}/edit"
    fill_in "brewery_location", with: new_location
    click_on "Update Brewery"

    expect(current_path).to eq "admin/breweries/#{brewery.id}"
    expect(page).to have_content "Nantucket, MA"
    end
  end
end
