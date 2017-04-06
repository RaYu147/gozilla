class Admin::QuestionSearchForm
  include ActiveModel::Model
  include HtmlBuilder

  attr_accessor :question_contents, :question_number, :test_basic_info_id

  def search
    rel = QuestionInfo.order(:id)

    if question_contents.present?
      rel = rel.where("question_contents like '%" + question_contents + "%'")
    end
    rel.order(:question_contents)
  end

  def search_question_number
    rel = question_number
  end

  def search_test_basic_info_id
    rel = test_basic_info_id
  end
end
