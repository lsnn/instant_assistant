require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InstantAssistant
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    client = Uber::Client.new do |config|
      config.server_token  = "uHf5yHFbjoE11qRnJW8pN8S98EX79hUc_xXPS4iW"
      config.client_id     = "GedPL-VxzxYQlxi5LBEAszPkvzkPkkm6"
      config.client_secret = "bQeKc3eGJvROos8N6i6Ay4BOm3FisjzsZOI1r9ec"
    end

    # client = Uber::Client.new do |config|
    #   config.server_token  = "uHf5yHFbjoE11qRnJW8pN8S98EX79hUc_xXPS4iW"
    # end
    # client.products(latitude: 52.370216, longitude: 4.895168)
  end
end
