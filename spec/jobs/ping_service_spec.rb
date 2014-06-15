require 'spec_helper'

describe PingService do
  fixtures :services
  let(:service) { services :connect }

  it "reports a ping for the service" do
    allow(service).to receive(:ping!).and_return true
    allow(User).to receive(:pluck).and_return ['test@example.com']
    expect(subject.perform(service)).to eq(true)
  end

  it "enqueues an admin notification if service is down" do
    allow(service).to receive(:ping!).and_return false
    allow(subject).to receive(:down?).and_return true
    allow(NotifyAdminsOfOutage).to receive(:enqueue).with(service)

    expect(subject.perform(service)).to eq(true)
  end
end
