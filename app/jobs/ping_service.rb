# Create a new status report for a given service in the background.
class PingService < ActiveJob::Base
  def perform(service)
    service.ping!
    EmailAdmins.enqueue service if service.down?
    true
  end
end
