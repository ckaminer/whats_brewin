require 'rails_helper'

RSpec.feature "User views all breweries" do
  scenario "sees all brewery names and locations" do
    brewery = Brewery.create(name: "Cisco Brewing Co.", location: "Nantucket, MA")
    visit breweries_path

    expect(page).to have_content "Cisco Brewing Co."

    click_on "Cisco Brewing Co."
    
    expect(current_path).to eq brewery_path(brewery)
  end
end
