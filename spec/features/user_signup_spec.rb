require 'spec_helper'

describe "the signup process", :type => :feature do
	before :each do
		@user = User.new(:name => "billy", :email => 'user@example.com', :password => 'password')
	end

	it "successful signup" do
		visit '/users/new'
		within(".new_user") do
			fill_in 'user_name', with: @user.name
			fill_in 'user_email', with: @user.email
			fill_in 'user_password', with: @user.password
			fill_in 'user_password_confirmation', with: @user.password
		end
		click_button("Create User")
		current_path.should eq("/users/1")
	end
end

describe "failed signup", :type => :feature do
	before :each do
		@user = User.new(:name => "", :email => 'user@example.com', :password => 'password')
	end

	it "signs me up" do
		visit '/users/new'
		within(".new_user") do
			fill_in 'user_name', with: @user.name
			fill_in 'user_email', with: @user.email
			# fill_in 'user_password', with: ""
		end
		click_button("Create User")
		current_path.should eq("/users/new")
	end
end
