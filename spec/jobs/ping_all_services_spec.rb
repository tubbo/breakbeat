require 'spec_helper'

describe PingAllServices do
  before do
    pingable = double 'Service', ping: true
    allow(Service).to receive(:all).and_return [pingable]
  end

  it "enqueues a ping for all services" do
    expect(subject.perform).to eq(true)
  end
end
