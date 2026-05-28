require_relative 'boot'
require 'rails'
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_dispatch/railtie'

Bundler.require(*Rails.groups)

module InternshipApi
  class Application < Rails::Application
    config.load_defaults 7.1
    config.api_only = true
  end
end
