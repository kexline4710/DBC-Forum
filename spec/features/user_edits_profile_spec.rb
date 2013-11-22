require 'spec_helper'

feature "the user profile edit process" do
  let(:user) { FactoryGirl.create(:user) }
  let(:new_name)  { "new goo" }
  let(:new_email)  { "new@goo.com" }


# This test does not test anything - under construction
  scenario "change user information" do
    visit edit_user_path(user)

    fill_in "Name", with: new_name
    fill_in "Email", with: new_email
    fill_in "Password", with: "password"
    click_button "Update User"

    visit user_path(user)

    expect(page).to have_text(new_name)
    expect(page).to have_text(new_email)
    # user.reload

    # expect(user.name).to eq new_name
    # expect(user.email).to eq new_email
  end
end
