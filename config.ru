# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

if Rails.env.production?
  require 'rack/cache'
  require 'redis-rack-cache'

  use Rack::Cache,
    metastore:   'redis://localhost:6379/1/breakbeat-rack-cache-metadata',
    entitystore: 'redis://localhost:6379/1/breakbeat-rack-cache-entities'
end

run Rails.application
