# arai add
class Admin::QuestionInfoSearchForm
  include ActiveModel::Model

  attr_accessor :contents

  def search
    rel = QuestionInfo
    rel = rel.where("question_infos.question_contents like '%" + contents + "%'") if contents.present?
    rel = rel.order(:id)
  end
end
