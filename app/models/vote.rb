class Vote < ActiveRecord::Base
  belongs_to :answer
  belongs_to :voter, class_name: "User" foreign_key: :user_id
end
