require 'spec_helper'

describe AnswersController do

  context "#create" do
    before(:all) do
      @user = User.create(name: "Oliver", email: "a@a.com", password: "Password", password_confirmation: "Password")
    end
    it "creates the answers object" do
      session[:user_id] = @user.id
      get :create, :answer => {body: "body"}, question_id: 1, responder_id: 1
      Answer.last.body.should eq("body")
    end

    it "redirects to the question page" do
      session[:user_id] = @user.id
      get :create, :answer => {body: "test body"}, question_id: 1, responder_id: 1
      response.should redirect_to question_path(1)
    end
  end

end
