class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.integer :min_volunteers
      t.integer :max_volunteers
      t.string :url
      t.references :partner, foreign_key: true

      t.timestamps null: false
    end
  end
end
