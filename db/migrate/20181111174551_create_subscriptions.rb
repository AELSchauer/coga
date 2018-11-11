class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.references :user, foreign_key: true
      t.references :partner, foreign_key: true

      t.timestamps null: false
    end
  end
end
