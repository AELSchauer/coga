class CreateVolunteers < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteers do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.integer :status
      t.integer :hours

      t.timestamps null: false
    end
  end
end
