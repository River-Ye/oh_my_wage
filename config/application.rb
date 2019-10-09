require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OhMyWage
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.time_zone = 'Taipei'
    config.active_record.default_timezone = :local
    # config.assets.initialize_on_precompile = false
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # 設定載入路徑
    # config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    # or
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]

    # 設定預設語系 zh or en
    config.i18n.default_locale = :"zh-TW"
    # or
    # config.i18n.default_locale = :en

    # use default locale when translation missing
    config.i18n.fallbacks = true
    # or
    # config.i18n.fallbacks = :"zh-TW"
  end
end