require 'spec_helper'

describe "email_addresses/edit" do
  before(:each) do
    @email_address = assign(:email_address, stub_model(EmailAddress,
      :email => "MyString",
      :contact_id => 1
    ))
  end

  it "renders the edit email_address form" do
    render
    assert_select "form[action=?][method=?]", email_address_path(@email_address), "post" do
      assert_select "input#email_address_email[name=?]", "email_address[email]"
      assert_select "input#email_address_contact_id[name=?]", "email_address[contact_id]"
    end
  end
end
