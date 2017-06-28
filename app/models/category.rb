class Category < ApplicationRecord
  include UrlSlugable

  has_many :categorizings
  has_many :articles, :through => :categorizings

  scope :most_popular_categories, MostPopularCategoriesQuery

  def to_param
    [name.parameterize].join("-") rescue nil
  end
end
