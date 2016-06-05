require 'rails_helper'

RSpec.feature "Admin creates a new brewery" do
  context "Admin passes valid data" do
    scenario "Admin is returned to brewery page" do
      admin = User.create(username: "Charlie", password: "PASSWORD", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_brewery_path
      name = "Cisco Brewing Co."
      location = "Nantucket, MA"

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
      admin = User.create(username: "Charlie", password: "PASSWORD", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      name = "Cisco Brewing Co."
      visit new_admin_brewery_path

      fill_in "Name", with: name
      click_on "Create Brewery"

      expect(page).to have_content "Location can't be blank"
    end
  end

  context "default users can not see/create a new brewery" do
    scenario "they see the 404 page" do
      user = User.create(username: "Charlie", password: "PASSWORD", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_brewery_path

      expect(page).to_not have_content "New Brewery"
      expect(page).to have_content "The page you were looking for doesn't exist (404)"
    end
  end
end
