class Answer < ActiveRecord::Base
  attr_accessible :question_id, :responder_id, :body

  belongs_to :question
  belongs_to :responder, class_name: "User"
end
