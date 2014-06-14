require 'spec_helper'

describe Service do
  fixtures :services, :reports
  subject { Service.new name: 'test', url: 'test.example.com' }

  it "validates parameters" do
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
      allow(Breakbeat).to receive(:ping).with(connect).and_return true
      allow(PingService).to receive(:enqueue)
    end

    it "enqueues a ping" do
      expect(connect.ping).to be_nil
      expect(PingService).to receive(:enqueue)
    end

    it "pings immediately" do
      expect(connect.ping!).to eq(true)
    end

    it "finds latest report status" do
      expect(subject.reports).to include(current_report)
      expect(subject.status).to eq(current_report)
    end
  end
end
