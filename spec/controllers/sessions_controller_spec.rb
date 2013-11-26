require 'spec_helper'

describe SessionsController do 

  context "#index" do

    context "renders the index template" do
      before do
        get :index  
      end

      it { should respond_with(:success) }
      it { should render_template(:index) }
    end
  end


  context "#new" do
    context "renders the new template" do
        before do
          get :new  
        end

        it { should respond_with(:success) }
        it { should render_template(:new) }
      end
    end

  context "#create" do
    it "redirects to user profile page upon successful login" do
      # p user = FactoryGirl.create(:user)
      @user = User.create(name: "Oliver", email: "a@a.com", password: "Password", password_confirmation: "Password")
      post :create, :user => {:email => "a@a.com", :password => 'Password'}
      response.should redirect_to user_path(User.find_by_email("a@a.com").id)
    end
    it "redirects to login page upon failed login" do
      #@user = User.create(name: "Oliver", email: "a@a.com", password: "Password", password_confirmation: "Password")
      post :create, :user => {:email => "o@a.com", :password => 'Password'}
      response.should redirect_to '/login'
    end
  end

  context '#destroy' do
    it "destroys the current stored session" do
      session[:user_id] = 10
      get 'destroy'
      expect(session[:user_id]).to eq(nil)
    end
    it "redirects to the root (sessions#index)" do
      get 'destroy'
      response.should redirect_to root_path
    end
  end
end
