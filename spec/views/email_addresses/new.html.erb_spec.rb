require 'spec_helper'

describe "email_addresses/new" do
  before(:each) do
    assign(:email_address, stub_model(EmailAddress,
      :email => "MyString",
      :contact_id => 1
    ).as_new_record)
  end

  it "renders new email_address form" do
    render

    assert_select "form[action=?][method=?]", email_addresses_path, "post" do
      assert_select "input#email_address_email[name=?]", "email_address[email]"
      assert_select "input#email_address_contact_id[name=?]", "email_address[contact_id]"
    end
  end
end
