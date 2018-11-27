class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.integer :name
      t.references :roleable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
