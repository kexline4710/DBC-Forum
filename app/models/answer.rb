class Answer < ActiveRecord::Base
  attr_accessible :id, :question_id, :responder_id, :body

  belongs_to :question
  belongs_to :responder, class_name: "User"
  has_many :votes

  # validates :question, presence: true

  def vote_score
  	@upvotes = self.votes.where("state = ?", 1).count 		# 3
  	@downvotes = self.votes.where("state = ?", 0).count	# 1
  	vote_score = @upvotes - @downvotes
  end
end
