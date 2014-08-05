require 'spec_helper'

describe EmailAddress do
  let(:email_address) {EmailAddress.new(email: 'sample@example.com')}

  it 'is valid' do
    expect(email_address).to be_valid
  end

  it 'is not valid if empty' do
    email_address.email = nil
    expect(email_address).to_not be_valid
  end
end
