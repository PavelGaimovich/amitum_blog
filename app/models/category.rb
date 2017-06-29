class Category < ApplicationRecord
  include UrlSlugable
  url_slug_parameter :name

  has_many :categorizings
  has_many :articles, :through => :categorizings

  scope :most_popular_categories, MostPopularCategoriesQuery
end
