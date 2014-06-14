# Basically just enqueues more jobs to ping, so we can distribute pings
# across sidekiq workers. Called every 1m by the scheduler.
class PingAllServices < ActiveJob::Base
  def perform
    Service.map(&:ping) and return true
  end
end
