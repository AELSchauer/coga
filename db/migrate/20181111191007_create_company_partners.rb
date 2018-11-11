class CreateCompanyPartners < ActiveRecord::Migration[5.0]
  def change
    create_table :company_partners do |t|
      t.references :company, foreign_key: true
      t.references :partner, foreign_key: true

      t.timestamps
    end
  end
end
