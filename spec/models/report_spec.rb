require 'spec_helper'

describe Report do
  fixtures :services

  let :service do
    services :cloudcast
  end

  subject do
    Report.new kind: 'good', description: 'awesome', service: service
  end

  it "belongs to a service" do
    subject.service = nil
    expect(subject).to_not be_valid
  end

  it "has a kind" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "has a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "finds the latest report for a service" do
    expect(Report.latest.first).to eq(Report.order(:created_at).first)
  end

  it "creates a new report automatically for a service" do
    allow(Breakbeat).to receive(:ping).and_return true
  end
end
