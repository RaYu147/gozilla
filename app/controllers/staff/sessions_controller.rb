class Staff::SessionsController < Staff::Base
# アクセス制御をスキップする
  skip_before_action :authorize

 def new
   if current_account
     redirect_to :staff_root
   else
     @form = Staff::LoginForm.new
     render action: 'new'
   end
 end

 # <めも さくま>以下、167ページまで進んだら実装
 def create
   @form = Staff::LoginForm.new(params[:staff_login_form])# ログインフォームに入力されたデータを保持する
   if @form.login_id.present?
     account = Account.find_by(login_id: @form.login_id)
   end
   if Staff::Authenticator.new(account).authenticate(@form.password)
     session[:account_id] = account.id
     flash.notice = 'ログインしました。'
     redirect_to :staff_root
   else
     flash.now.alert = '入力したログイン情報に誤りがあります。'
     render action: 'new'
   end
 end

 # 以下、169ページまで進んだら実装
 # ログアウト機能
 def destroy
   session.delete(:account_id)
   flash.notice = 'ログアウトしました。'
   redirect_to :staff_login
 end
end
