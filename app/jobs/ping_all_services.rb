# A scheduled job, occurring every 1 minute, which enqueues other
# services to be pinged.
class PingAllServices < ActiveJob::Base
  def perform
    Service.map(&:ping) and return true
  end
end
