require 'spec_helper'

describe UsersController do 

  context "#create" do
    # before do
    #   get :create, :user => {name: "Oliver", email: "a@a.com", password: "Password", password_confirmation: "Password"}
    # end

    # subject { assigns(:user) }

    # its(:name) { should eq "Oliver" }

    it "should create a user" do
      get :create, :user => {name: "Oliver", email: "a@a.com", password: "Password", password_confirmation: "Password"}
      user = assigns(:user)
      user.name.should eq "Oliver"
    end
  end

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

  context "#UPDATE" do
    context "w/ correct info" do
      before(:each) do
        @user = User.create(name: "Oliver", email: "a@a.com", password: "Password", password_confirmation: "Password")
        post :update, :id => @user.id, :user => {:name => "mike"}
        @user.reload
      end
      it "should be able to update the users name" do
        expect(@user.name).to eq "mike"
      end
      
      it { should redirect_to user_path(@user) }
    end
    # context "w/o correct info" do
    #   before(:each) do
    #     @user = User.create(name: "Oliver", email: "a@a.com", password: "Password", password_confirmation: "Password")
    #     post :update, :id => @user.id, :user => {:name => "mike"}
    #     @user.reload
    #   end
      
    #   it "should shoudl redirect back to edit user if the password is not provided" do
    #     expect(subject).to redirect_to edit_user_path(@user)
    #   end

    #   it "should give you a flash message" do
    #     flash[:notice].should eq "You must specify password and confirmation"
    #   end
    # end
  end
end
