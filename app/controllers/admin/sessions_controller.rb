class Admin::SessionsController < Admin::Base
# アクセス制御をスキップする
  skip_before_action :authorize

  def new
    if current_account
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = Admin::LoginForm.new(params[:admin_login_form])
    if @form.login_id.present?
      account = Account.find_by(login_id: @form.login_id)
    end
    if Admin::Authenticator.new(account).authenticate(@form.password)
      session[:account_id] = account.id
      flash.notice = 'ログインしました。'
      redirect_to :admin_root
    else
      flash.now.alert = '入力したログイン情報に誤りがあります。'
      render action: 'new'
    end
  end

  def destroy
    session.delete(:account_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :admin_login
  end

# 9/13 sessionでは値は保持しないです、消します
  # # 9/12 p163 arai
  # # sessionで選択肢数を受け渡す試み .joins(:question_choice_infos)
  # def question_new
  #   @form = Admin::QuestionNewForm.new
  #   @search_form = Admin::QuestionInfoSearchForm.new
  #   @question_infos = QuestionInfo.all
  #   @question_info_and_choice = QuestionInfo.join(:question_choice).find(params[:id])
  #   render action: 'question_infos'
  # end
  # ####
end
