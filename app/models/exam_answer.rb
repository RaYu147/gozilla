class ExamAnswer < ActiveRecord::Base
  # sakuma 0912 参照p286
  belongs_to :exam_info, class_name: 'ExamInfo', foreign_key: 'exam_info_id'
  belongs_to :test_info, class_name: 'TestInfo', foreign_key: 'test_info_id'
  belongs_to :question_choice_info, class_name: 'QuestionChoiceInfo', foreign_key: 'question_choice_info_id'
end
