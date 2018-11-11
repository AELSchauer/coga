class CreateSocialNetworks < ActiveRecord::Migration[5.0]
  def change
    create_table :social_networks do |t|
      t.string :name
      t.json :profile_template

      t.timestamps null: false
    end
  end
end
