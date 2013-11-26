require 'spec_helper'

describe "the signup process", :type => :feature do
	# before :each do
	# 	@user = create(:user)
	# end

	before do
		visit new_user_path
 		fill_in("Name", with: user.name)
		fill_in("Email", with: user.email)
	end

	let(:user) { create(:user) }

	context "succesful signup" do
		it "creates a new user and directs them to user profile" do

		# user.name = "Joe"
		# LOOKIT! You have to reload after changing the attributes
		# user.save && user.reload

		# visit '/users/new'
		# LOOKIT! You can pass in the path explicitly like above
		# visit new_user_path

		# within(".new_user") do
		# 	fill_in 'user_name', with: "Joe"
		# 	fill_in 'user_email', with: "test@test.com"
		# 	fill_in 'user_password', with: "pas"
		# 	fill_in 'user_password_confirmation', with: "pas"
		# end

		# LOOKIT! You don't have denote that it is within new user if only displayed once on the page
		# fill_in("Name", with: user.name)
		# LOOKIT! May have to alter if there is a validation
		# fill_in("Email", with: user.email)
		fill_in("Password", with: user.password)
		fill_in("Confirm Password", with: user.password)

		# LOOKIT! Check to see that the user has been added to the db
		expect { click_button("Create User") }.to change(User, :count).by(1)

		expect(page).to have_content("New User Created")

		current_path.should eq users_path
		end
	end

	context "failed signup" do

	it "does not create a new user and gives error message" do
		# save_and_open_page
		# visit '/users/new'
		# visit new_user_path

		# within(".new_user") do
			# fill_in 'user_name', with: 'name'
			# fill_in 'user_email', with: 'email@email.com'
		# end

		# fill_in()

		click_button("Create User")

		expect(page).to have_content("User not Created")

		current_path.should eq new_user_path
	end
end
end
