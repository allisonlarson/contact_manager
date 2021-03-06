require 'spec_helper'

describe EmailAddressesController do

  let(:valid_attributes) { { "email" => "MyString", "contact_id" => 1, "contact_type" => 'Person'} }
  let(:valid_session) { {} }

  describe "GET new" do
    it "assigns a new email_address as @email_address" do
      get :new, {}, valid_session
      assigns(:email_address).should be_a_new(EmailAddress)
    end
  end

  describe "GET edit" do
    it "assigns the requested email_address as @email_address" do
      email_address = EmailAddress.create! valid_attributes
      get :edit, {:id => email_address.to_param}, valid_session
      assigns(:email_address).should eq(email_address)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      let(:alice) { Person.create(first_name: 'Alice', last_name: 'Smith')}
      let(:valid_attributes) {{email: '555-1234', contact_id: alice.id, contact_type: 'Person'}}
      it "creates a new EmailAddress" do
        expect {
          post :create, {:email_address => valid_attributes}, valid_session
        }.to change(EmailAddress, :count).by(1)
      end

      it "assigns a newly created email_address as @email_address" do
        post :create, {:email_address => valid_attributes}, valid_session
        assigns(:email_address).should be_a(EmailAddress)
        assigns(:email_address).should be_persisted
      end

      it "redirects to the person who created email_address" do
        post :create, {:email_address => valid_attributes}, valid_session
        response.should redirect_to(alice)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved email_address as @email_address" do
        EmailAddress.any_instance.stub(:save).and_return(false)
        post :create, {:email_address => { "email" => "invalid value" }}, valid_session
        assigns(:email_address).should be_a_new(EmailAddress)
      end

      it "re-renders the 'new' template" do
        EmailAddress.any_instance.stub(:save).and_return(false)
        post :create, {:email_address => { "email" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:bob) {Person.create(first_name: 'Bob', last_name: 'Smith')}
      let(:valid_attributes) {{email: 'email@email.com', contact_id: bob.id, contact_type: 'Person'}}

      it "updates the requested email_address" do
        email_address = EmailAddress.create! valid_attributes

        EmailAddress.any_instance.should_receive(:update).with({ "email" => "MyString" })
        put :update, {:id => email_address.to_param, :email_address => { "email" => "MyString" }}, valid_session
      end

      it "assigns the requested email_address as @email_address" do
        email_address = EmailAddress.create! valid_attributes
        put :update, {:id => email_address.to_param, :email_address => valid_attributes}, valid_session
        assigns(:email_address).should eq(email_address)
      end

      it "redirects to the email_address" do
        email_address = EmailAddress.create! valid_attributes
        put :update, {:id => email_address.to_param, :email_address => valid_attributes}, valid_session
        response.should redirect_to(bob)
      end
    end

    describe "with invalid params" do
      it "assigns the email_address as @email_address" do
        email_address = EmailAddress.create! valid_attributes
        EmailAddress.any_instance.stub(:save).and_return(false)
        put :update, {:id => email_address.to_param, :email_address => { "email" => "invalid value" }}, valid_session
        assigns(:email_address).should eq(email_address)
      end

      it "re-renders the 'edit' template" do
        email_address = EmailAddress.create! valid_attributes
        EmailAddress.any_instance.stub(:save).and_return(false)
        put :update, {:id => email_address.to_param, :email_address => { "email" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    let(:bob) {Person.create(first_name: 'Bob', last_name: 'Smith')}
    let(:valid_attributes) {{email: 'email@email.com', contact_id: bob.id, contact_type: 'Person'}}

    it "destroys the requested email_address" do
      email_address = EmailAddress.create! valid_attributes
      expect {
        delete :destroy, {:id => email_address.to_param}, valid_session
      }.to change(EmailAddress, :count).by(-1)
    end

    it "redirects to the email_addresses list" do
      email_address = EmailAddress.create! valid_attributes
      delete :destroy, {:id => email_address.to_param}, valid_session
      response.should redirect_to(bob)
    end
  end

end
