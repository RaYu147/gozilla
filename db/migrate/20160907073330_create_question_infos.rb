class CreateQuestionInfos < ActiveRecord::Migration
  def change
    create_table :question_infos do |t|
      t.string :question_contents, null: false, :limit=>256
      t.integer :question_count, null: false
      t.string :slug, null: false, :limit=>10
      t.integer :status, null: false

      t.references :created_account, null: false
      t.references :updated_account, null: false

      t.timestamps null: false
    end

    add_foreign_key :question_infos, :accounts, column: :created_account_id
    add_foreign_key :question_infos, :accounts, column: :updated_account_id
  end
end
