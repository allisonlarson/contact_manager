class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
      t.string :email
      t.integer :person_id

      t.timestamps
    end
  end
end
