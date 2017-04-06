class CreateExamInfos < ActiveRecord::Migration
  def change
    create_table :exam_infos do |t|
      t.references :account, null: false
      t.references :test_basic_info, null: false
      t.integer :exam_count, null: false
      t.datetime :exam_complete_date

      t.timestamps null: false
    end

    add_foreign_key :exam_infos, :accounts, column: :account_id
    add_foreign_key :exam_infos, :test_basic_infos, column: :test_basic_info_id
  end
end
