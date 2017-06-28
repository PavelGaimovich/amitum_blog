module UrlSlugable
  extend ActiveSupport::Concern

  included do
    before_create :set_url_slug

    def self.find(input)
      if input.is_a?(Integer)
        super
      else
        find_by_url_slug(input)
      end
    end

    def set_url_slug
      self.url_slug = to_param
    end

    def to_param
      [title.parameterize].join("-") rescue nil
    end
  end
end
