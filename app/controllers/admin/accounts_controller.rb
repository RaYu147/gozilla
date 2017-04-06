class Admin::AccountsController < Admin::Base

  def index
    @search_form = Admin::AccountSearchForm.new(params[:search])
    @accounts = @search_form.search.page(params[:page])
  end

  def new
    @accounts = Account.new
  end

  def show
    @accounts = Account.find(params[:id])
    render action: 'show'
  end

  def create
    @accounts = Account.new(account_params)
    @hash_password_form = Admin::HashPasswordForm.new(object: @accounts)
    @hash_password_form.object

    if @hash_password_form.save

      flash.notice = '社員情報を登録しました。'
      @search_form = Admin::AccountSearchForm.new(params[:search])
      @accounts = @search_form.search.page(params[:page])
      redirect_to :admin_accounts
    else
      render action: 'new'
    end
  end

  def edit
    @accounts = Account.find(params[:id])
  end

  def update
    @accounts = Account.find(params[:id])
    @accounts.assign_attributes(account_params)
    if @accounts.save
      flash.notice = '社員情報を編集しました。'
      redirect_to :admin_accounts
    else
      render action: 'edit'
    end
  end

  def destroy
    account = Account.find(params[:id])
    account.destroy!
    flash.notice = '社員情報を削除しました。'
    redirect_to :admin_accounts
  end

  private
  #Strong Parametersによる防御
  def account_params
    params.require(:account).permit(
      :id,
      :authority_category, :login_id, :password,
      :account_name, :mail_address, :remarks, :slug,
      :status, :created_account_id, :updated_account_id,
      :created_at, :updated_at
    )
  end

end
