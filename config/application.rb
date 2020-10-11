require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SHUMI
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.generators.template_engine = :slim # デフォルトのテンプレートをslimに変更
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.assets.paths << config.root.join("vendor/assets/javascripts")
	  config.assets.paths << config.root.join("vendor/assets/stylesheets")
    config.time_zone = 'Tokyo'
  end
end
