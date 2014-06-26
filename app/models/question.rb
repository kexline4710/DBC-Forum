class Question < ActiveRecord::Base
  belongs_to :asker, class_name: "User"
  has_many :answers

  attr_accessible :title, :body, :asker_id

  validates :title, :presence => true
  validates :body, :presence => true
  validates :asker_id, :presence => true

  # after_save :reset_cache
  # before_filter :authenticate

  def ordered_answers
  	@answers = self.answers.sort_by! { |answer| answer.vote_score }
  	@answers.reverse
  end

  def self.store_question
    Rails.cache.fetch("Questions", :expires_in => 20.seconds) do
      self.find(:all)
     end
  end

private

  # def reset_cache
  #   Rails.cache.clear
  # end
end
