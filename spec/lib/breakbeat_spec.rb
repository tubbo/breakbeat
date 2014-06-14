require 'spec_helper'
require 'breakbeat'

describe Breakbeat do
  let(:service) { Service.new name: 'example', url: 'example.com' }
  before do
    allow(Mixlib::ShellOut).to receive(:new).with('ping -c 1 example.com').and_return(
      double('Mixlib::ShellOut', :run_command => true, :error? => false)
    )
  end

  it "returns app config scoped to breakbeat params" do
    expect(Breakbeat.config).to eq(Rails.application.config.breakbeat)
  end

  context "when pinging a service" do
    it "returns true when the command succeeded" do
      allow(Mixlib::ShellOut).to receive(:new).with('ping -c 1 example.com').and_return(
        double('Mixlib::ShellOut', :run_command => true, :error? => false)
      )

      expect(Breakbeat.ping(service)).to eq(true)
    end

    it "returns false when the command failed" do
      allow(Mixlib::ShellOut).to receive(:new).with('ping -c 1 example.com').and_return(
        double('Mixlib::ShellOut', :run_command => true, :error? => true)
      )

      expect(Breakbeat.ping(service)).to eq(false)
    end
  end
end
