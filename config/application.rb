require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AmitumBlog
  class Application < Rails::Application
    config.load_defaults 5.1
    config.autoload_paths << "#{Rails.root}/queries"
    I18n.available_locales = [:en, :ru]
    config.time_zone = 'Riga'
    config.i18n.default_locale = :ru
  end
end
