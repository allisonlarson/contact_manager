require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the company view', type: :feature do
  describe 'has phone numbers that' do
    let(:company) { Company.create(name: 'John') }

    before(:each) do
      company.phone_numbers.create(number: "555-1234")
      company.phone_numbers.create(number: "555-5678")
      visit company_path(company)
    end

    it 'shows the phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end

    it 'has a link to add a new phone number' do
      expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: company.id, contact_type: 'Company'))
    end

    it 'adds a new phone number' do
      page.click_link('Add phone number')
      page.fill_in('Number', with: '555-8888')
      page.click_button('Create Phone number')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('555-8888')
    end

    it 'has links to edit phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href: edit_phone_number_path(phone))
      end
    end

    it 'edits a phone number' do
      phone = company.phone_numbers.first
      old_number = phone.number

      first(:link, 'edit').click
      page.fill_in('Number', with: '555-9191')
      page.click_button('Update Phone number')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('555-9191')
      expect(page).to_not have_content(old_number)
    end

    it 'deletes a phone number' do
      bad_number = company.phone_numbers.first
      good_number  = company.phone_numbers.last

      first(:link, 'delete').click
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content(good_number.number)
      expect(page).to_not have_content(bad_number.number)
    end
  end

  describe 'has email addresses that' do
    let(:company) { Company.create(name: 'Walmart') }

    before(:each) do
      company.email_addresses.create(email: "email@email.com")
      company.email_addresses.create(email: "admin@admin.com")
      visit company_path(company)
    end

    it 'has a list of email addresses' do
      expect(page).to have_selector('li', text: company.email_addresses.first.email)
    end

    it 'has an add email address link' do
      expect(page).to have_link('Add email address', href: new_email_address_path(contact_id: company.id, contact_type: 'Company'))
    end

    it 'creates a new email address' do
      page.click_link('Add email address')
      fill_in 'Email', with: 'new@email.com'
      page.click_on('Create Email address')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('new@email.com')
    end

    it 'edits email addresses' do
      email = company.email_addresses.first
      old_email = email.email

      first(:link, 'edit').click
      page.fill_in('Email', with: 'new@email.com')
      page.click_button('Update Email address')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('new@email.com')
      expect(page).to_not have_content(old_email)
    end

    it 'deletes email addresses' do
      bad_email = company.email_addresses.first
      good_email = company.email_addresses.last

      first(:link, 'delete').click
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content(good_email.email)
      expect(page).to_not have_content(bad_email.email)
    end

  end

end
