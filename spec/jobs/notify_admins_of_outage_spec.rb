require 'spec_helper'

describe NotifyAdminsOfOutage do
  fixtures :services

  let(:service) { services :connect }

  before do
    allow(User).to receive(:pluck).and_return ['test@example.com']
  end

  it "enqueues a mail delivery to all admins" do
    expect(subject.perform(service)).to be_a(Mail::Message)
  end
end
