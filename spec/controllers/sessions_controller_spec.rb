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
    before do
      post :create, :email => "tan@dbc.com", :password => "12234"
    end
    
    context "user login information is incorrect" do
      it { should redirect_to('/login') }
    end

  end
end
