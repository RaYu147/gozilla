class CreateYearManagements < ActiveRecord::Migration
  def change
    create_table :year_managements do |t|
      t.integer :year, null: false
      t.string :year_name, null: false, :limit=>100
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :remarks, null: false, :limit=>256
      t.string :slug, null: false, :limit=>10
      t.integer :status, null: false

      t.references :created_account, null: false
      t.references :updated_account, null: false

      t.timestamps null: false
    end

    add_foreign_key :year_managements, :accounts, column: :created_account_id
    add_foreign_key :year_managements, :accounts, column: :updated_account_id
  end
end
