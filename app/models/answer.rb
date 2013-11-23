class Answer < ActiveRecord::Base
  attr_accessible :id, :question_id, :responder_id, :body

  belongs_to :question
  belongs_to :responder, class_name: "User"
end
