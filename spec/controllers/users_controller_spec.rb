require 'spec_helper'

describe UsersController do 

  context "#show" do

    context "renders the users profile template" do
      before do
        @user = User.create(name: "Oliver", email: "a@a.com", password: "Password", password_confirmation: "Password")
        get :show, :id => @user.id
      end

      it { should respond_with(:success) }
      it { should render_template(:show) }
    end
  end


  context "#edit" do
    context "renders the users profile edit template" do
        before do
          @user = User.create(name: "Oliver", email: "a@a.com", password: "Password", password_confirmation: "Password")
          get :edit, :id => @user.id 
        end

        it { should respond_with(:success) }
        it { should render_template(:edit) }
      end
    end
  end
