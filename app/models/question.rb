class Question < ActiveRecord::Base
  belongs_to :asker, class_name: "User"
  has_many :answers
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  attr_accessible :title, :body, :asker_id, :tag_names

  validates :title, :presence => true
  validates :body, :presence => true
  validates :asker_id, :presence => true

  after_save :assign_tags

  private

  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/, /).map do |name|
        Tag.find_or_create_by_name(name)
      end
    end
  end


end
