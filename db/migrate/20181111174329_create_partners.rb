class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :email_domain
      t.string :website_url

      t.timestamps null: false
    end
  end
end
