 require 'spec_helper'

#  describe "the user profile edit process", :type => :feature do


#   context "#update" do
#     it "updates the user attributes" do
#         before do
#         user = FactoryGirl.create(:user)
#         get :edit, :id => user.id
#     end
#       put :update, :name => "new_name", :email => "new@email.com", :password => "new_password"
#       response.should redirect_to user_path(user)
#     end
#     it "redirects to login page upon failed login" do
#       post :create, :email => "fail@fail.com", :password => 'meh'
#       response.should redirect_to '/login'
#     end
#   end
# end
