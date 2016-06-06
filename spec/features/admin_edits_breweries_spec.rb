require 'rails_helper'

RSpec.feature "Admin edits a brewery" do
  context "only an admin can edit" do
    scenario "they see the page with the form to edit the brewery's info" do
    admin = User.create(username: "Charlie", password: "PASSWORD", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    brewery = Brewery.create(name: "Cisco Brewing Co.", location: "Nantucket, Mass")
    visit admin_brewery_path(brewery)
    new_location = "Nantucket, MA"

    click_on "Edit Brewery"

    expect(current_path).to eq "/admin/breweries/#{brewery.id}/edit"
    fill_in "brewery_location", with: new_location
    click_on "Update Brewery"

    expect(current_path).to eq "/admin/breweries/#{brewery.id}"
    expect(page).to have_content "Nantucket, MA"
    end
  end
end
