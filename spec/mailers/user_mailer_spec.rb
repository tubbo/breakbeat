require "spec_helper"

describe UserMailer do
  fixtures :services

  context "when requesting report on a recent outage" do
    let(:service) { services :connect }
    let(:mail) { UserMailer.report_needed_for service }

    before do
      allow(User).to receive(:pluck).with(:email).and_return ['admin@example.com']
      mail.deliver
    end

    it "sends the mail successfully" do
      expect(ActionMailer::Base.deliveries).to_not be_empty
    end

    it "addresses the mail to all admins" do
      expect(mail.to).to include('admin@example.com')
    end

    it "is sent from the breakbeat address" do
      expect(mail.from).to include('breakbeat@telvue.com')
    end

    it "includes the service name in the subject" do
      expect(mail.subject).to match(/#{service.name}/)
    end

    it "includes the text from the mailer view" do
      expect(mail.body).to_not be_blank
    end
  end
end
