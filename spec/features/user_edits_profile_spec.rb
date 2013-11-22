require 'spec_helper'

describe "the user profile edit process", :type => :feature do
  describe "edit" do
    let(:user) { FactoryGirl.create(user) }
    before do
      sign_in user
      visit edit user_path(user)
    end

    describe "change user information" do
      let(:new_name)  { "new goo" }
      let(:new_name)  { "new@goo.com" }
      before do
        fill_in "Name", with: new_name
        fill_in "Email", with: new_email
        fill_in "Password", with: "password"
        click_button "Submit"
        specify { expect(user.reload.name).to eq new_name }
        specify { expect(user.reload.email).to eq new_email }
      end
    end
  end
end
