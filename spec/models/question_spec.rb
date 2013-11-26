require 'spec_helper'

describe Question do

  it { should belong_to(:asker) }
  it { should have_many(:answers) }
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:body) }
  it { should allow_mass_assignment_of(:asker_id) }

  # need to test ordered_answers
end
