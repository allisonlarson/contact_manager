require 'spec_helper'

describe "email_addresses/show" do
  before(:each) do
    @email_address = assign(:email_address, stub_model(EmailAddress,
      :email => "Email",
      :contact_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Email/)
    rendered.should match(/1/)
  end
end
