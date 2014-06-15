class EmailAdmins < ActiveJob::Base
  def perform(service)
    UserMailer.report_needed_for(service).deliver
  end
end
