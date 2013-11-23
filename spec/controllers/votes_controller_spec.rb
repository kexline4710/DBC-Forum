require 'spec_helper'

describe VotesController do

  context '#create' do
    it 'creates the vote object if none exists' do
      session[:user_id] = 1
      answer = FactoryGirl.create(:answer)
      post :create, :answer_id => answer.id, :vote => 1
      expect(Vote.exists?(answer_id: answer.id, voter_id: session[:user_id])).to be_true
    end

    it 'updates the vote object if one already exists' do
      session[:user_id] = 1
      answer = FactoryGirl.create(:answer)
      vote = FactoryGirl.create(:vote)
      post :create, :answer_id => answer.id, :vote => 0
      expect(Vote.exists?(answer_id: answer.id, voter_id: session[:user_id], state: 0)).to be_true
    end
    
  end

end