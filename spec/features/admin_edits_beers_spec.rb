require 'rails_helper'

RSpec.feature "Admin edits a beer" do
  context "only an admin can edit" do
    scenario "they see the page with the form to edit the beer's info" do
    admin = User.create(username: "Charlie", password: "PASSWORD", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    brewery = Brewery.create(name: "Cisco Brewing Co.", location: "Nantucket, Mass")
    style = Style.create(name: "Belgian White")
    beer = Beer.create(name: "Grey Laylee", brewery_id: brewery.id, style_id: style.id)
    visit admin_beer_path(beer)
    new_name = "Grey Lady"

    click_on "Edit Beer"

    expect(current_path).to eq "/admin/beers/#{beer.id}/edit"
    fill_in "beer_name", with: new_name
    click_on "Update Beer"

    expect(current_path).to eq "/admin/beers/#{beer.id}"
    expect(page).to have_content "Grey Lady"
    end
  end
end
