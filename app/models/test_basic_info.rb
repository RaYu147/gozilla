class TestBasicInfo < ActiveRecord::Base
  has_many :test_infos, class_name: 'TestInfo', dependent: :destroy
  has_many :exam_infos, class_name: 'ExamInfo', dependent: :destroy

  belongs_to :year_management, class_name: 'YearManagement', foreign_key: 'year_management_id'
  belongs_to :account, class_name: 'Account', foreign_key: 'created_account_id' 'updated_account_id'

  validates :question_count, numericality: {
    only_integer: true,
    greater_than: 0,
    less_than_or_equal_to: 20
  }

  validates :pass_grade, numericality: {
    only_integer: true,
    greater_than: 0,
    less_than_or_equal_to: :question_count
  }

end
