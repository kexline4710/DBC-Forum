require 'spec_helper'

describe Answer do

  it { should belong_to(:question) }
  it { should belong_to(:responder) }
  it { should have_many(:votes) }

  #need to test vote_score

end
