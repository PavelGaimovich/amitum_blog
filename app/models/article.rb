class Article < ApplicationRecord
  include UrlSlugable
  belongs_to :user

  paginates_per 5

  def register_view
    self.views_count += 1
    self.save
  end
end
