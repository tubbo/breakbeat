require 'spec_helper'

describe User do
  subject do
    User.new \
      email: 'test@example.com',
      password: 'testpassword',
      password_confirmation: 'testpassword'
  end

  it "represents someone who is logged in" do
    expect(subject).to be_valid
  end

  it "must have an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "must have a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "must confirm a password" do
    subject.password = '123'
    subject.password_confirmation = '456'
    expect(subject).to_not be_valid
  end
end
