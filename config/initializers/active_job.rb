# Set the ActiveJob queue adapter.
ActiveJob::Base.queue_adapter = Rails.application.config.breakbeat.queue_adapter
