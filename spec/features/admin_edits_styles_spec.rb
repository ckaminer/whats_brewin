require 'rails_helper'

RSpec.feature "Admin edits a style" do
  context "only an admin can edit" do
    scenario "they see the page with the form to edit the style's info" do
    admin = User.create(username: "Charlie", password: "PASSWORD", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    style = Style.create(name: "Belgian Wheat")
    visit admin_style_path(style)
    new_name = "Belgian White"

    click_on "Edit Style"

    expect(current_path).to eq "/admin/styles/#{style.id}/edit"
    fill_in "style_name", with: new_name
    click_on "Update Style"

    expect(current_path).to eq "/admin/styles/#{style.id}"
    expect(page).to have_content "Belgian White"
    end
  end
end
