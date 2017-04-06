class Admin::PasswordsController < Admin::Base
  def show
    redirect_to :edit_admin_password
  end

  def edit
    @change_password_form =
      Admin::ChangePasswordForm.new(object: current_account)
  end

  def update
    @change_password_form = Admin::ChangePasswordForm.new(account_params)
    @change_password_form.object = current_account
    if @change_password_form.save
      flash.notice = "パスワードを変更しました。"
      redirect_to :admin_root
    else
      flash.now.alert = "パスワードが一致しません"
      render action: 'edit'
    end
  end

  private
  def account_params
    params.require(:admin_change_password_form).permit(
      :current_password, :new_password, :new_password_confirmation
    )
  end
end
