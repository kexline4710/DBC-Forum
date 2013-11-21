class Question < ActiveRecord::Base
  belongs_to :asker, class_name: "User"
  has_many :answers

  attr_accessible :title, :body, :asker_id

  validates :title, :presence => true
  validates :body, :presence => true
  validates :asker_id, :presence => true

end
