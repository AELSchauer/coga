class CreateTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :tokens do |t|
      t.integer :name
      t.string :token, index: true, unique: true
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
