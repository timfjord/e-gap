class Page < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  
  scope :published, -> { where arel_table[:published_on].not_eq(nil) }
  scope :unpublished, -> { where published_on: nil }
  
  def unpublished?
    !published_on
  end
  
  def published?
    !unpublished?
  end
  
  def publish
    update_attribute :published_on, DateTime.current
    self
  end
  
  def unpublish
    update_attribute :published_on, nil
    self
  end
end
