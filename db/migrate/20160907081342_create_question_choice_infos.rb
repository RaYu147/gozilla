class CreateQuestionChoiceInfos < ActiveRecord::Migration
  def change
    create_table :question_choice_infos do |t|
      t.references :question_info, null: false
      t.integer :choice_number, null: false
      t.string :choice_contents, null: false, :limit=>256
      t.integer :correct_status, null: false
      t.string :slug, null: false, :limit=>10

      t.references :created_account, null: false
      t.references :updated_account, null: false

      t.timestamps null: false
    end

    add_foreign_key :question_choice_infos, :question_infos, column: :question_info_id
    add_foreign_key :question_choice_infos, :accounts, column: :created_account_id
    add_foreign_key :question_choice_infos, :accounts, column: :updated_account_id
  end
end
