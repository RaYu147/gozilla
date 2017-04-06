class Staff::Base < ApplicationController
  before_action :authorize

  private
  # 現在ログインしているStaffMemberオブジェクトを返すメソッド
  def current_account
    if session[:account_id]
      @current_account ||=
        Account.find_by(id: session[:account_id])
    end
  end

# :current_accountをヘルパーメソッドとして登録
  helper_method :current_account

# アクセス制御のメソッド 本クラス冒頭で使用
  def authorize
    unless current_account
      flash.alert = 'ログインしてください。'
      redirect_to :staff_login
    end
  end
end
