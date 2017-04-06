class TestSearchFormPresenter < FormPresenter
  def pull_down(name, label_text, choices, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m << form_builder.select(name, choices, {include_blank: true}, options)
    end
  end
end
