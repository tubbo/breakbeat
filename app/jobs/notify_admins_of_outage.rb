# Send a mail when an outage occurs for a given Service.
class NotifyAdminsOfOutage < ActiveJob::Base
  def perform(service)
    UserMailer.report_needed_for(service).deliver
  end
end
