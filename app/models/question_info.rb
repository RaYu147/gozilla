class QuestionInfo < ActiveRecord::Base
  # p.397参照 9/9 arai
  has_many :question_choice_infos, class_name: 'QuestionChoiceInfo', dependent: :destroy
  # 9/21 arai
  accepts_nested_attributes_for :question_choice_infos
  #
  # 選択肢と1対多の関係。dependentオプションにより設問が削除される直前に関連付けられた選択肢も削除
  # 9/13 arai 担当分
  has_many :test_infos, class_name: 'TestInfo'
  belongs_to :account, class_name: 'Account', foreign_key: 'created_account_id' 'updated_account_id'
  ##

  # 9/27 arai
  validates :question_contents, presence: true, :length => { :maximum => 256 }
  # ここまで

end
