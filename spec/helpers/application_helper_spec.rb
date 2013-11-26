require 'spec_helper'

describe ApplicationHelper do

	context "#current_user" do
		it "returns the current user of the session" do
			user = FactoryGirl.create(:user)
			session[:user_id] = user.id
			helper.current_user.should eql(User.find(user.id))
		end
	end

    context "#flash_class" do
      it "returns the correct flash class if success"  do
        flash_class(:success).should eq "success"
      end

      it "returns the correct flash class if an error" do
        flash_class(:error).should eq "error"
      end
    end
end