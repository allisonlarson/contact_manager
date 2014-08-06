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
end
