class Answer < ActiveRecord::Base
  attr_accessible :id, :question_id, :responder_id, :body

  belongs_to :question
  belongs_to :responder, class_name: "User"
  has_many :votes

  def vote_score
  	@upvotes = self.votes.where("state = ?", 1).count 		# 3
  	@downvotes = self.votes.where("state = ?", 0).count	# 1
  	vote_score = @upvotes - @downvotes
  end

  def upvotes_count
  	@upvotes = self.votes.where("state = ?", 1).count
  end

  def downvotes_count
  	@downvotes = self.votes.where("state = ?", 0).count
  end
end
