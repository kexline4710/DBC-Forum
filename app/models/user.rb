class User < ActiveRecord::Base

  attr_accessible :name, :email, :password, :password_confirmation, :about

	has_secure_password

  has_many :questions, foreign_key: :asker_id
  has_many :votes, foreign_key: :voter_id
  has_many :answers, foreign_key: :responder_id

  validates :password, presence: true
end
