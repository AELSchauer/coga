class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :confirmation_token
      t.string :reset_token
      t.string :first_name
      t.string :last_name
      t.string :company_email
      t.string :contact_email
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
