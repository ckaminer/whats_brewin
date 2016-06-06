require 'rails_helper'

RSpec.feature "User rates beers" do
  scenario "beer is added to user_beer with rating" do
    # As a user, you visit a beer's show page
    # There should be a form at the bottom showing the rankings 1-5
    # If you click one of those rankings you should then be able to submit the form
    # There should be a flash message letting the user know their vote has been submitted

    user = User.create(username: "Charlie", password: "password", role: 0)
    brewery = Brewery.create(name: "Cisco Brewing Co.", location: "Nantucket, MA")
    style = Style.create(name: "Belgian White")
    beer = Beer.create(name: "Grey Lady", brewery: brewery, style: style)

    visit beer_path(beer)

    click_button "5"
    click_button "Rate this beer!"

    expect(page).to have_content "Thanks for your input!  Your rating has been stored!"
    expect(current_path).to eq user_ratings_path(user)
  end
end
