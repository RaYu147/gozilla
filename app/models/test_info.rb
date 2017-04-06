class TestInfo < ActiveRecord::Base
  has_many :exam_answers, class_name: 'ExamAnswer', dependent: :destroy

  belongs_to :test_basic_info, class_name: 'TestBasicInfo', foreign_key: 'test_basic_info_id'
  belongs_to :question_info, class_name: 'QuestionInfo', foreign_key: 'question_info_id'
  belongs_to :account, class_name: 'Account', foreign_key: 'created_account_id' 'updated_account_id'
end
