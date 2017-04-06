# 9/28 arai add

class QuestionChoiceInfoPresenter < FormPresenter
  def choice_td_block(name, label_text, options = {})
    markup(:td, class: 'input-block') do |m|
      m << label(name, label_text, class: options[:required] ? 'required' : nil)
      m << text_field(name, options)
      m << error_messages_for(name)
    end
  end
end
