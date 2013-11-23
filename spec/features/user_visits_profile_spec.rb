require 'spec_helper'

feature "the user profile page" do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question, :asker => user) }
   
  scenario "should display user's questions" do
  
    question

    # visit new user page
    # create new user
    # visit user's profile
    # click create question
    # create question


    visit user_path(user)

    expect(page).to have_link(question.title)
  end
end
