class Staff::PasswordsController < Staff::Base
  def show
    redirect_to :edit_staff_password
  end

  def edit
    @change_password_form =
      Staff::ChangePasswordForm.new(object: current_account)
  end

  def update
    @change_password_form = Staff::ChangePasswordForm.new(account_params)
    @change_password_form.object = current_account
    if @change_password_form.save
      flash.notice = "パスワードを変更しました。"
      redirect_to :staff_root
    else
      flash.now.alert = "パスワードが一致しません"
      render action: 'edit'
    end
  end

  private
  def account_params
    params.require(:staff_change_password_form).permit(
      :current_password, :new_password, :new_password_confirmation
    )
  end
end
