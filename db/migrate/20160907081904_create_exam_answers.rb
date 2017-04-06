class CreateExamAnswers < ActiveRecord::Migration
  def change
    create_table :exam_answers do |t|
      t.references :exam_info, null: false
      t.references :test_info, null: false
      t.references :question_choice_info, null: false

      t.timestamps null: false
    end

    add_foreign_key :exam_answers, :exam_infos, column: :exam_info_id
    add_foreign_key :exam_answers, :test_infos, column: :test_info_id
    add_foreign_key :exam_answers, :question_choice_infos, column: :question_choice_info_id
  end
end
