class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :type
      t.references :user, foreign_key: true
      t.references :roleable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
