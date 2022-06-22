require 'rails_helper'

RSpec.describe Phone, type: :model do
  subject { Phone.new(make: 'Phone', model: 'Test', serial: '123456789') }

  it 'is valid if required attributes are there' do
    expect(subject).to be_valid
  end

  it 'is not valid without make' do
    subject.make = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without model' do
    subject.model = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without serial' do
    subject.serial = nil
    expect(subject).to_not be_valid
  end
end
