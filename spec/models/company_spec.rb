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
end
