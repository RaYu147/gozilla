class ExamInfo < ActiveRecord::Base
  belongs_to :account, class_name: 'Account', foreign_key: 'account_id'
  has_many :exam_answer, class_name: 'ExamAnswer', dependent: :destroy
  belongs_to :test_basic_info, class_name: 'TestBasicInfo', foreign_key: 'test_basic_info_id'
end
