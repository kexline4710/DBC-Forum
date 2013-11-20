require 'spec_helper'

describe User do

  it { should have_many(:questions) }
  it { should have_many(:votes) }
  it { should have_many(:answers) }

end
