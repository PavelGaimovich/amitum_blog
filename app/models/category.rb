class Category < ApplicationRecord
  include UrlSlugable

  has_many :categorizings
  has_many :articles, :through => :categorizings

  def to_param
    [name.parameterize].join("-") rescue nil
  end
end
