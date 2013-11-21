
class User < ActiveRecord::Base

	has_secure_password validations: false

  has_many :questions, foreign_key: :asker_id
  has_many :votes, foreign_key: :voter_id
  has_many :answers, foreign_key: :responder_id

  validates :password, presence: true

end
