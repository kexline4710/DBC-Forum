class User < ActiveRecord::Base
  has_many :questions
  has_many :votes
  has_many :answers
end
