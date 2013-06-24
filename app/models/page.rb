class Page < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  
  scope :published, -> { where arel_table[:published_on].not_eq(nil).and(arel_table[:published_on].lteq(DateTime.current)) }
  scope :unpublished, -> { where arel_table[:published_on].eq(nil).or(arel_table[:published_on].gt(DateTime.current)) }
  
  def unpublished?
    !published_on || published_on > DateTime.current
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
  
  def total_words
    title.scan(/\w+/).size + content.scan(/\w+/).size
  end
end
