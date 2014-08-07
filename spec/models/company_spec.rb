require 'spec_helper'

describe Company do
  let(:walmart) {Company.create(name: 'Walmart')}

  it 'is valid' do
    expect(walmart).to be_valid
  end

  it 'is not valid without a name' do
    walmart.name = nil
    expect(walmart).to_not be_valid
  end

  it 'has an array of phone numbers' do
    expect(walmart.phone_numbers).to eq([])
  end

  it "responds with its phone numbers after they're created" do
    phone_number = walmart.phone_numbers.build(number: "333-4444")
    expect(phone_number.number).to eq('333-4444')
  end

  it 'has an array of email addresses' do
    expect(walmart.email_addresses).to eq([])
  end

  it "responds with its email addresses after they're created" do
    email_address = walmart.email_addresses.build(email: "email")
    expect(email_address.email).to eq('email')
  end

  it "convert to a string with name of company" do
    expect(walmart.to_s).to eq "Walmart"
  end

end
