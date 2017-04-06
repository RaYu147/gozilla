class Admin::Base < ApplicationController
  before_action :authorize

  # private
  def current_account
    if session[:account_id]
      @current_account ||=
      Account.find_by(id: session[:account_id])
    end
  end

  helper_method :current_account

# アクセス制御のメソッド 本クラス冒頭で使用
  def authorize
    unless current_account
      flash.alert = '管理者としてログインしてください。'
      redirect_to :admin_login
    end
  end
end
