require 'rails_helper'

RSpec.feature "Admin deletes a brewery" do
  context "only an admin can edit" do
    scenario "they are returned to the admin brewery index" do
    admin = User.create(username: "Charlie", password: "PASSWORD", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    brewery = Brewery.create(name: "Cisco Brewing Co.", location: "Nantucket, MA")
    visit admin_brewery_path(brewery)

    click_on "Delete Brewery"

    expect(current_path).to eq admin_breweries_path

    expect(page).to have_no_content "Cisco Brewing Co."
    end
  end
end
