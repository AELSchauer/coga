class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, index: true
      t.string :primary_email, index: true
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
