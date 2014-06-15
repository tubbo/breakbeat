require 'spec_helper'
require 'webmock/rspec'
require 'breakbeat'

describe Breakbeat do
  let(:service) { Service.new name: 'example', url: 'example.com' }

  it "returns app config scoped to breakbeat params" do
    expect(Breakbeat.config).to eq(Rails.application.config.breakbeat)
  end

  context "when pinging a service with http" do
    it "returns true when the request succeeds" do
      stub_request(:get, service.url).to_return status: 200
      expect(Breakbeat.ping(service)).to eq(true)
    end

    it "returns true when the request redirects" do
      stub_request(:get, service.url).to_return status: 301
      expect(Breakbeat.ping(service)).to eq(true)
    end

    it "returns false when the request failed" do
      stub_request(:get, service.url).to_return status: 404
      expect(Breakbeat.ping(service)).to eq(false)
    end

    it "returns false when the request errors" do
      stub_request(:get, service.url).to_return status: 500
      expect(Breakbeat.ping(service)).to eq(false)
    end
  end
end
