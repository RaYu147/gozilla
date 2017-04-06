class ChangePasswordFormPresenter < FormPresenter

  def password_field_block_with_if(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << label(name, label_text,
        class: options[:required] ? 'required' : nil)
      m << password_field(name, options)
      #"パスワードが空白で入力された場合"のみエラーメッセージを枠下に表示
      object.errors.full_messages_for(name).each do |message|
        if message == 'パスワードを入力してください'
          m.div(class: 'error-message') do |m|
            m.text message
          end
        end
      end
    end
  end
end
