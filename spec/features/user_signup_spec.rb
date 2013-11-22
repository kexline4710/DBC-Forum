require 'spec_helper'

describe "the signup process", :type => :feature do
	before :each do
		@user = FactoryGirl.create(:user)
	end

	it "successful signup" do
		
		visit '/users/new'
		within(".new_user") do
			fill_in 'user_name', with: "Joe"
			fill_in 'user_email', with: "test@test.com"
			fill_in 'user_password', with: "pas"
			fill_in 'user_password_confirmation', with: "pas"
		end

		click_button("Create User")

		current_path.should eq user_path(User.last.id) 

	end
end

describe "failed signup", :type => :feature do

	it "signs me up" do
		visit '/users/new'
		within(".new_user") do
			fill_in 'user_name', with: 'name'
			fill_in 'user_email', with: 'email@email.com'
		end
		click_button("Create User")
		current_path.should eq("/users/new")
	end
end
