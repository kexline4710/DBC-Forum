require 'spec_helper'

feature 'User creates question' do

  context "user is logged in" do
    before(:each) do
      @user = User.create(name: "Oliver", email: "a@a.com", password: "Password", password_confirmation: "Password")
      # @user = FactoryGirl.create(:user)
      visit login_path
      fill_in 'Email', :with => @user.email
      fill_in 'Password', :with => @user.password
      click_button("Login")
    end

    it 'should show the create question page if logged_in' do
      visit new_question_path
      expect(page).to have_content('Create a new question!')
    end

    it 'should be able to create a question with valid input' do
      visit new_question_path
      fill_in 'Title', :with => 'Title'
      fill_in 'Body', :with => 'Body'
      click_button 'Save Question'
      current_path.should eq question_path(Question.last.id)
    end

    it "should display the new questions page again with invalid input" do
      visit new_question_path
      click_button 'Save Question'
      current_path.should eq new_question_path
    end

  end

  context "user is not logged in" do
    it 'should redirect and say you need to be logged in' do
      visit new_question_path
      expect(page).to have_content('You must be logged in to create a question.')
    end
  end
end
