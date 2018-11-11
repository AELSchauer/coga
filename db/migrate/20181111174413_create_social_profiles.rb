class CreateSocialProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :social_profiles do |t|
      t.json :profile_data
      t.string :organizaton_type
      t.integer :organization_id
      t.references :social_network, foreign_key: true

      t.timestamps null: false
    end
  end
end
