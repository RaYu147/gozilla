class CreateTestBasicInfos < ActiveRecord::Migration
  def change
    create_table :test_basic_infos do |t|
      t.references :year_management, null: false
      t.integer :question_count, null: false
      t.integer :pass_grade, null: false
      t.string :slug, null: false, :limit=>10

      t.references :created_account, null: false
      t.references :updated_account, null: false

      t.timestamps null: false
    end

    add_foreign_key :test_basic_infos, :year_managements, column: :year_management_id
    add_foreign_key :test_basic_infos, :accounts, column: :created_account_id
    add_foreign_key :test_basic_infos, :accounts, column: :updated_account_id
  end
end
