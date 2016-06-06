require 'rails_helper'

RSpec.feature "User rates beers" do
  scenario "beer is added to user_beer with rating" do
    user = User.create(username: "Charlie", password: "password", role: 0)
    visit login_path
    fill_in "Username", with: "Charlie"
    fill_in "Password", with: "password"
    click_button "Login"
    brewery = Brewery.create(name: "Cisco Brewing Co.", location: "Nantucket, MA")
    style = Style.create(name: "Belgian White")
    beer = Beer.create(name: "Grey Lady", brewery: brewery, style: style)

    visit beer_path(beer)

    choose "5"
    click_button "Rate this beer!"
    expect(page).to have_content "Thanks for your input!  Your rating has been stored!"
    expect(current_path).to eq beer_path(beer)
  end
end
