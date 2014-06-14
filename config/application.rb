$LOAD_PATH << File.expand_path('../../lib', __FILE__)
require File.expand_path('../boot', __FILE__)

require "rails"

%w(
  active_record
  action_controller
  action_view
  action_mailer
  sprockets
).each do |framework|
  begin
    require "#{framework}/railtie"
  rescue LoadError
  end
end

# Load business logic
require 'breakbeat'

# Require the gems listed in Gemfile
Bundler.require :default, Rails.env

module Breakbeat
  class Application < Rails::Application
    # Use EST as our local time zone. (UTC is default)
    config.time_zone = 'Eastern Time (US & Canada)'

    # Use annotated Ember.js unless we're in prod.
    config.ember.variant = :development

    # Immediately execute jobs unless we're in prod.
    config.breakbeat.queue_adapter = :inline
  end
end
