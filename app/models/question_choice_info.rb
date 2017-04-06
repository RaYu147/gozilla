class QuestionChoiceInfo < ActiveRecord::Base
  has_many :exam_answers, class_name: 'ExamAnswer'

  belongs_to :question_info, class_name: 'QuestionInfo', foreign_key: 'question_info_id'
  belongs_to :account, class_name: 'Account', foreign_key: 'created_account_id' 'updated_account_id'

  # 9/27 arai
  validates :choice_contents, presence: true, :length => { :maximum => 256, :too_long => "最大256文字です。" }
  # ここまで
end
