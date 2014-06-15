require 'spec_helper'

describe ServiceSerializer do
  fixtures :services
  let(:service) { services :cloudcast }
  subject { ServiceSerializer.new service }

  it "serializes attributes" do
    expect(subject.name).to eq(service.name)
  end

  it "presents status as latest report's kind" do
    expect(subject.status).to eq(service.status.kind)
  end

  it "presents status_message as latest report's description" do
    expect(subject.status_message).to eq(service.status.description)
  end
end
