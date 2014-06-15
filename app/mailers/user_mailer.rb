class UserMailer < ActionMailer::Base
  default from: "breakbeat@telvue.com"

  def report_needed_for(service)
    @service = service
    return unless @service.present?
    mail \
      to: User.pluck([:email]),
      subject: "Please report on #{@service.name}'s recent downtime"
  end
end
