require 'spec_helper'

feature 'User creates post' do
  scenario 'using the form' do
    visit '/questions/new'
    fill_in 'Title', :with => 'My sweet question'
    fill_in 'Body', :with => 'Moar deets'
    click_button 'Save Question'
  end
end
