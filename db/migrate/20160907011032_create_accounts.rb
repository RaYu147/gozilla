class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :authority_category, null: false
      t.string :login_id, null: false, :limit=>100
      t.string :password, null: false, :limit=>256
      t.string :account_name, null: false, :limit=>100
      t.string :mail_address, null: false, :limit=>256
      t.string :remarks, null: false, :limit=>256
      t.string :slug, null: false, :limit=>10
      t.integer :status, null: false

      t.references :created_account, null: false
      t.references :updated_account, null: false

      t.timestamps null: false
    end

    add_foreign_key :accounts, :accounts, column: :created_account_id
    add_foreign_key :accounts, :accounts, column: :updated_account_id
  end
end
