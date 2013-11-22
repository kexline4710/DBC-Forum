require 'spec_helper'

describe ApplicationHelper do

	describe "#current_user" do
		it "returns the current user of the session" do
			user = FactoryGirl.create(:user)
			session[:user_id] = user.id
			helper.current_user.should eql(User.find(user.id))
		end
		ß
	end

end