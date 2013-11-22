require 'spec_helper'

describe QuestionsController do

  context '#new' do
    context "renders the new template" do
      before do
        get :new
      end

      it { should respond_with(:success) }
      it { should render_template(:new) }
    end
  end

  context "#create" do

    it "redirects to root on successful question creation" do
      session[:user_id] = 1
      post :create, :question => FactoryGirl.attributes_for(:question)
      response.should redirect_to "/questions/1"
    end

    it "redirects to new question form on failed question creation" do
      session[:user_id] = 1
      post :create, :question => FactoryGirl.attributes_for(:question, :title => nil)
      response.should redirect_to new_question_path
    end

  end


end
