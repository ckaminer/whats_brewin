require 'rails_helper'

RSpec.feature "Admin creates a new beer" do
  context "Admin passes valid data" do
    scenario "Admin is returned to beer page" do
      brewery = Brewery.create(name: "Cisco Brewing Co.", location: "Nantucket, MA")
      style = Style.create(name: "Belgian White")
      admin = User.create(username: "Charlie", password: "PASSWORD", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_beer_path
      name = "Grey Lady"

      fill_in "Name", with: name
      find(".brewery-select").find(:xpath, 'option[2]').select_option
      find(".style-select").find(:xpath, 'option[2]').select_option
      click_on "Create Beer"

      expect(page).to have_content "Grey Lady"
      expect(page).to have_content "Cisco Brewing Co."
      expect(page).to have_content "Belgian White"
      expect(current_path).to eq beer_path(Beer.find_by(name: name))
    end
  end

  context "the submitted data is invalid" do
    scenario "they see an error message" do
      admin = User.create(username: "Charlie", password: "PASSWORD", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      name = "Grey Lady"
      visit new_admin_beer_path

      fill_in "Name", with: name
      click_on "Create Beer"

      expect(page).to have_content "Brewery can't be blank"
      expect(page).to have_content "Style can't be blank"
    end
  end

  context "default users can not see/create a new brewery" do
    scenario "they see the 404 page" do
      user = User.create(username: "Charlie", password: "PASSWORD", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_beer_path

      expect(page).to_not have_content "New Beer"
      expect(page).to have_content "The page you were looking for doesn't exist (404)"
    end
  end
end
