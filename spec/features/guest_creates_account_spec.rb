require 'rails_helper'

RSpec.feature "Guest creates a new account" do
  scenario "user is directed to personal account page" do
    visit new_user_path
    fill_in "Username", with: "Charlie"
    fill_in "Password", with: "PASSWORD"
    click_button "Create Account"

    assert page.has_content?("Welcome, Charlie!")
  end
end
