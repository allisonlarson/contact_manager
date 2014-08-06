require 'spec_helper'

describe PhoneNumbersController do

  let(:valid_attributes) { { "number" => "MyString", contact_id: 1, contact_type: 'Person' } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all phone_numbers as @phone_numbers" do
      phone_number = PhoneNumber.create! valid_attributes
      get :index, {}, valid_session
      assigns(:phone_numbers).should eq([phone_number])
    end
  end

  describe "GET show" do
    it "assigns the requested phone_number as @phone_number" do
      phone_number = PhoneNumber.create! valid_attributes
      get :show, {:id => phone_number.to_param}, valid_session
      assigns(:phone_number).should eq(phone_number)
    end
  end

  describe "GET new" do
    it "assigns a new phone_number as @phone_number" do
      get :new, {}, valid_session
      assigns(:phone_number).should be_a_new(PhoneNumber)
    end
  end

  describe "GET edit" do
    it "assigns the requested phone_number as @phone_number" do
      phone_number = PhoneNumber.create! valid_attributes
      get :edit, {:id => phone_number.to_param}, valid_session
      assigns(:phone_number).should eq(phone_number)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      let (:bob) {Person.create(first_name: 'Bob', last_name: 'Jones')}
      let (:valid_attributes) {{number: '555-5678',contact_id: bob.id, contact_type: 'Person'}}

      it "creates a new PhoneNumber" do
        expect {
          post :create, {:phone_number => valid_attributes}, valid_session
        }.to change(PhoneNumber, :count).by(1)
      end

      it "assigns a newly created phone_number as @phone_number" do
        post :create, {:phone_number => valid_attributes}, valid_session
        assigns(:phone_number).should be_a(PhoneNumber)
        assigns(:phone_number).should be_persisted
      end

      it "redirects to the created phone_number" do
        post :create, {:phone_number => valid_attributes}, valid_session
        response.should redirect_to(bob)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved phone_number as @phone_number" do
        PhoneNumber.any_instance.stub(:save).and_return(false)
        post :create, {:phone_number => { "number" => "invalid value" }}, valid_session
        assigns(:phone_number).should be_a_new(PhoneNumber)
      end

      it "re-renders the 'new' template" do
        PhoneNumber.any_instance.stub(:save).and_return(false)
        post :create, {:phone_number => { "number" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do

      let (:bob) {Person.create(first_name: 'Bob', last_name: 'Jones')}
      let (:valid_attributes) {{number: '555-5678', contact_id: bob.id, contact_type: 'Person'}}
      it "updates the requested phone_number" do
        phone_number = PhoneNumber.create! valid_attributes
        PhoneNumber.any_instance.should_receive(:update).with({ "number" => "MyString" })
        put :update, {:id => phone_number.to_param, :phone_number => { "number" => "MyString" }}, valid_session
      end

      it "assigns the requested phone_number as @phone_number" do
        phone_number = PhoneNumber.create! valid_attributes
        put :update, {:id => phone_number.to_param, :phone_number => valid_attributes}, valid_session
        assigns(:phone_number).should eq(phone_number)
      end

      it "redirects to the phone_number" do
        phone_number = PhoneNumber.create! valid_attributes
        put :update, {:id => phone_number.to_param, :phone_number => valid_attributes}, valid_session
        response.should redirect_to(bob)
      end
    end

    describe "with invalid params" do
      it "assigns the phone_number as @phone_number" do
        phone_number = PhoneNumber.create! valid_attributes
        PhoneNumber.any_instance.stub(:save).and_return(false)
        put :update, {:id => phone_number.to_param, :phone_number => { "number" => "invalid value" }}, valid_session
        assigns(:phone_number).should eq(phone_number)
      end

      it "re-renders the 'edit' template" do
        phone_number = PhoneNumber.create! valid_attributes
        PhoneNumber.any_instance.stub(:save).and_return(false)
        put :update, {:id => phone_number.to_param, :phone_number => { "number" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do

    let (:bob) {Person.create(first_name: 'Bob', last_name: 'Smith')}
    let (:valid_attributes) {{number: "123435345", contact_id: bob.id, contact_type: 'Person'}}

    it "destroys the requested phone_number" do
      phone_number = PhoneNumber.create! valid_attributes
      expect {
        delete :destroy, {:id => phone_number.to_param}, valid_session
      }.to change(PhoneNumber, :count).by(-1)
    end

    it "redirects to the phone_numbers list" do
      phone_number = PhoneNumber.create! valid_attributes
      delete :destroy, {:id => phone_number.to_param}, valid_session
      response.should redirect_to(bob)
    end
  end

end
