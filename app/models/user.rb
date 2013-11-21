require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_secure_password
  has_many :questions, foreign_key: :asker_id
  has_many :votes, foreign_key: :voter_id
  has_many :answers, foreign_key: :responder_id

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
