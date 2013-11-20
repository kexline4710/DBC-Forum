class Question < ActiveRecord::Base
  belongs_to :asker, class_name: "User", foreign_key: :user_id
  has_many :answers
end
