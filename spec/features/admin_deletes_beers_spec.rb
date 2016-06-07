require 'rails_helper'

RSpec.feature "Admin deletes a beer" do
  context "only an admin can delete" do
    scenario "they are returned to the admin beer index" do
    admin = User.create(username: "Charlie", password: "PASSWORD", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    brewery = Brewery.create(name: "Cisco Brewing Co.", location: "Nantucket, MA")
    style = Style.create(name: "Belgian White")
    beer = Beer.create(name: "Grey Lady", brewery_id: brewery.id, style_id: style.id)
    
    visit admin_beer_path(beer)

    click_on "Delete Beer"

    expect(current_path).to eq admin_beers_path

    expect(page).to have_no_content "Grey Lady"
    end
  end
end
