require 'rails_helper'

RSpec.feature "Admin creates a new style" do
  context "Admin passes valid data" do
    scenario "Admin is returned to style page" do
      admin = User.create(username: "Charlie", password: "PASSWORD", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_style_path
      name = "Belgian White"

      fill_in "Name", with: name
      click_on "Create Style"

      expect(page).to have_content "Belgian White"
      expect(current_path).to eq style_path(Style.find_by(name: name))
    end
  end
  #
  # context "the submitted data is invalid" do
  #   scenario "they see an error message" do
  #     admin = User.create(username: "Charlie", password: "PASSWORD", role: 1)
  #     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  #
  #     name = "Cisco Brewing Co."
  #     visit new_admin_brewery_path
  #
  #     fill_in "Name", with: name
  #     click_on "Create Brewery"
  #
  #     expect(page).to have_content "Location can't be blank"
  #   end
  # end
  #
  # context "default users can not see/create a new brewery" do
  #   scenario "they see the 404 page" do
  #     user = User.create(username: "Charlie", password: "PASSWORD", role: 0)
  #
  #     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  #
  #     visit new_admin_brewery_path
  #
  #     expect(page).to_not have_content "New Brewery"
  #     expect(page).to have_content "The page you were looking for doesn't exist (404)"
  #   end
  # end
end
