require 'rails_helper'

RSpec.feature "Admin deletes a style" do
  context "only an admin can delete" do
    scenario "they are returned to the admin style index" do
    admin = User.create(username: "Charlie", password: "PASSWORD", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    style = Style.create(name: "Belgian White")
    visit admin_style_path(style)

    click_on "Delete Style"

    expect(current_path).to eq admin_styles_path

    expect(page).to have_no_content "Belgian White"
    end
  end
end
