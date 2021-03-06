require 'spec_helper'

describe Answer do

  it { should belong_to(:question) }
  it { should belong_to(:responder) }
  it { should have_many(:votes) }

  it "returns a vote_score" do
		answer = FactoryGirl.create(:answer)
  	answer.votes.create(voter_id: 1, state: 1)
  	answer.vote_score.should == 1
  end

end
