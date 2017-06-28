class Article < ApplicationRecord
  include UrlSlugable

  belongs_to :user
  has_many :categorizings
  has_many :categories, :through => :categorizings

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

  def all_categories=(names)
    self.categories = names.split(",").map do |name|
      Category.where(name: name.strip).first_or_create!
    end
  end

  def all_categories
    self.categories.map(&:name).join(", ")
  end

  private

  def set_modify_until
    self.modify_until = Time.now + 1.hour
  end
end
