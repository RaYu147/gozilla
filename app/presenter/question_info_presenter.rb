# 9/27 arai テスト作成

class QuestionInfoPresenter < FormPresenter
  def question_notes
    markup(:div, class: 'notes') do |m|
      m.text '256文字以内で入力してください。'
    end
  end
end
