class Category < ApplicationRecord
  has_many :categorizings
  has_many :articles, :through => :categorizings
end
