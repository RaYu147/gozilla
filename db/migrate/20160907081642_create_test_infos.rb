class CreateTestInfos < ActiveRecord::Migration
  def change
    create_table :test_infos do |t|
      t.references :test_basic_info, null: false
      t.references :question_info, null: false
      t.integer :question_number, null: false
      t.string :slug, null: false, :limit=>10

      t.references :created_account, null: false
      t.references :updated_account, null: false

      t.timestamps null: false
    end

    add_foreign_key :test_infos, :test_basic_infos, column: :test_basic_info_id
    add_foreign_key :test_infos, :question_infos, column: :question_info_id
    add_foreign_key :test_infos, :accounts, column: :created_account_id
    add_foreign_key :test_infos, :accounts, column: :updated_account_id
  end
end
