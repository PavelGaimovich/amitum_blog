module UrlSlugable
  extend ActiveSupport::Concern

  included do
    def self.find(input)
      if input.is_a?(Integer)
        super
      else
        find_by_title(input)
      end
    end
  end

  def to_param
    [title.parameterize].join("-")
  end
end
