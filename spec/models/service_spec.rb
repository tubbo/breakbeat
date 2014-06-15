require 'spec_helper'
require 'breakbeat/pinger'

describe Service do
  fixtures :services, :reports
  subject { Service.new name: 'test', url: 'test.example.com' }

  it "exists in telvue's infrastructure" do
    expect(subject).to be_valid
  end

  it "must have a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "validates url" do
    subject.url = '%9r1831'
    expect(subject).to_not be_valid
  end

  context "when checking status" do
    let(:connect) { services :connect }
    let(:current_report) { reports :connect_is_down }

    before do
      allow(Breakbeat::Pinger).to receive(:check_status_for).with(connect.url).and_return true
    end

    it "enqueues a ping" do
      expect(connect).to respond_to :ping
    end

    it "pings immediately" do
      expect(connect.ping!).to eq(true)
    end
  end
end
