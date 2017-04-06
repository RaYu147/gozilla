class Account < ActiveRecord::Base

  has_many :year_managements, class_name: 'YearManagement'
  has_many :test_basic_infos, class_name: 'TestBasicInfo'
  has_many :question_infos, class_name: 'QuestionInfo'
  has_many :test_infos, class_name: 'TestInfo'
  has_many :question_choice_infos, class_name: 'QuestionChoiceInfo'
  has_many :exam_infos, class_name: 'ExamInfo'

  belongs_to :account, class_name: 'Account', foreign_key: 'created_account_id' 'updated_account_id'

  # validates :login_id, uniqueness: { allow_blank: true }

  def pass=(raw_password)
    if raw_password.kind_of?(String)
      self.password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.password = nil
    end
  end

end
