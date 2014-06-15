require 'spec_helper'

describe ReportSerializer do
  fixtures :reports
  let(:report) { reports :cloudcast_is_good }
  subject { ReportSerializer.new report }

  it "serializes kind" do
    expect(subject.kind).to eq(report.kind)
  end

  it "serializes description" do
    expect(subject.description).to eq(report.description)
  end
end
