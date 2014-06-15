require 'spec_helper'
require 'webmock/rspec'
require 'breakbeat/pinger'

module Breakbeat
  describe Pinger do
    let(:url) { 'example.com' }

    context "when pinging a service with http" do
      it "returns true when the request succeeds" do
        stub_request(:get, url).to_return status: 200
        expect(Pinger.check_status_for(url)).to eq(true)
      end

      it "returns true when the request redirects" do
        stub_request(:get, url).to_return status: 301
        expect(Pinger.check_status_for(url)).to eq(true)
      end

      it "returns false when the request failed" do
        stub_request(:get, url).to_return status: 404
        expect(Pinger.check_status_for(url)).to eq(false)
      end

      it "returns false when the request errors" do
        stub_request(:get, url).to_return status: 500
        expect(Pinger.check_status_for(url)).to eq(false)
      end
    end
  end
end
