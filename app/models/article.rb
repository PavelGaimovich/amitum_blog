class Article < ApplicationRecord
  include UrlSlugable

  belongs_to :user

  before_validation :set_modify_until

  validates :title, :text, presence: true
  validates_with CanModifyArticleValidator

  paginates_per 5

  def register_view
    self.views_count += 1
    self.save
  end

  def can_modify?
    self.modify_until >= Time.now
  end

  private

  def set_modify_until
    self.modify_until = Time.now + 1.hour
  end
end
