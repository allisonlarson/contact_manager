require 'spec_helper'

describe "phone_numbers/show" do
  before(:each) do
    @phone_number = assign(:phone_number, stub_model(PhoneNumber,
      :number => "Number",
      :contact_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Number/)
    rendered.should match(/1/)
  end
end
