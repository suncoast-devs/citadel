# frozen_string_literal: true

require_relative 'boot'

require 'rails'
require 'active_model/railtie'
# require "active_job/railtie"
require 'active_record/railtie'
# require "active_storage/engine"
require 'action_controller/railtie'
# require "action_mailer/railtie"
require 'action_view/railtie'

Bundler.require(*Rails.groups)

module Citadel
  class Application < Rails::Application
    config.load_defaults 7.0
    config.time_zone = 'Eastern Time (US & Canada)'
    config.generators do |g|
      g.helper = false
      g.assets = false
    end
  end
end
