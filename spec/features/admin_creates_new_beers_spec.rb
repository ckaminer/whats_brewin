require 'rails_helper'
#
# RSpec.feature "Admin creates a new beer" do
#   context "Admin passes valid data" do
#     scenario "Admin is returned to beer page" do
#       brewery = Brewery.create(name: "Cisco Brewing Co.", location: "Nantucket, MA")
#       admin = User.create(username: "Charlie", password: "PASSWORD", role: 1)
#       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
#
#       visit new_admin_beer_path
#       name = "Grey Lady"
#       brewery = "Cisco Brewing Co."
#       style = "Belgian White"
#
#       fill_in "Name", with: name
#       click_on "Brewery"
#       click_on brewery
#       click_on "Style"
#       click_on style
#       click_on "Create Beer"
#
#       expect(page).to have_content "Grey Lady"
#       expect(page).to have_content "Cisco Brewing Co."
#       expect(page).to have_content "Belgian White"
#       expect(current_path).to eq beer_path(Beer.find_by(name: name))
#     end
#   end
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
# end
