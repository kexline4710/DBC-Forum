require 'spec_helper'

describe AnswersController do

  context "#create" do
    it "creates the answers object" do
      get :create, :answer => {body: "body"}, question_id: 1, user_id: 1
      Answer.last.body.should eq("body")
    end

    it "redirects to the question page" do
      get :create, :answer => {body: "test body"}, question_id: 1, user_id: 1
      response.should redirect_to question_path(1)
    end
  end

end
