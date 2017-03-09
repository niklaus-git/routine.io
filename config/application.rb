require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RoutineIo
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
    end

    # Apply custom layouts to Devise controllers
    config.to_prepare do
      Devise::SessionsController.layout proc{ |controller| action_name == 'new' ? "authentication" : "application" }
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "authentication" }
      Devise::ConfirmationsController.layout "application"
      Devise::UnlocksController.layout "application"
      Devise::PasswordsController.layout "application"
    end

    # Rescue Pundit with 403 Page
    config.action_dispatch.rescue_responses["Pundit::NotAuthorizedError"] = :forbidden

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
