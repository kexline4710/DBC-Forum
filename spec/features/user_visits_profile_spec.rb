require 'spec_helper'

feature "the user profile page" do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question, :asker => user)}
  let(:answer) { FactoryGirl.create(:answer, :question => question, :responder => user) }
  scenario "should display user's questions" do

    question #must be included in this block to provide reference
    # visit new user page
    # create new user
    # visit user's profile
    # click create question
    # create question
    visit user_path(user)

    expect(page).to have_link(question.title)
  end

  scenario "should display user's questions" do

    answer #must be included in this block to provide reference

    visit user_path(user)

    expect(page).to have_link(answer.body)
  end
end

