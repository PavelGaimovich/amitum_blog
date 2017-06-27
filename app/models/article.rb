class Article < ApplicationRecord
  belongs_to :user

  paginates_per 5

  def to_param
    [title.parameterize].join("-")
  end

  def self.find(input)
    if input.is_a?(Integer)
      super
    else
      find_by_title(input)
    end
  end
end
