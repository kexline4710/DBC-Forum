require 'spec_helper'

describe QuestionsController do

  context '#new' do
    describe 'redirects to new question form if user is logged in' do
      before(:each) do
        session[:user_id] = 1
        get :new
      end
      it { should respond_with(:success) }
      it { should render_template(:new) }
    end

    context 'displays error message if user is not logged in' do
      before(:each) do
        get :new
      end
      it { should redirect_to root_path }
    end

  end

  context "#create" do

    it "redirects to root on successful question creation" do
      session[:user_id] = 1
      post :create, :question => FactoryGirl.attributes_for(:question)
      response.should redirect_to "/questions/#{Question.last.id}"
    end

    it "redirects to new question form on failed question creation" do
      session[:user_id] = 1
      post :create, :question => FactoryGirl.attributes_for(:question, :title => nil)
      response.should redirect_to new_question_path
    end
  end
end

# need to restest the show action
