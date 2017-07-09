class Article < ApplicationRecord
  include UrlSlugable
  url_slug_parameter :title

  mount_uploader :article_picture, ArticlePictureUploader

  belongs_to :user
  has_many :categorizings, :dependent => :delete_all
  has_many :categories, :through => :categorizings

  validates :title, :text, presence: true
  validates :title, uniqueness: true
  
  paginates_per 5

  def register_view
    self.views_count += 1
    self.save
  end

  def all_categories=(names)
    self.categories = names.split(",").uniq.map do |name|
      Category.where(name: name.strip).first_or_create!
    end
  end

  def all_categories
    self.categories.map(&:name).join(", ")
  end
end
