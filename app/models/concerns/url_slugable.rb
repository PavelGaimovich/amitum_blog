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
  end

  class_methods do
    def url_slug_parameter(parameter)
      define_method(:to_param) do
        [send(parameter).parameterize].join("-") rescue nil
      end
    end
  end
end
