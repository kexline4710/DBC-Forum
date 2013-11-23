class Vote < ActiveRecord::Base
	attr_accessible :answer_id, :voter_id, :state

  belongs_to :answer
  belongs_to :voter, class_name: "User"
end
