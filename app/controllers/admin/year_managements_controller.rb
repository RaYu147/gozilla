class Admin::YearManagementsController < Admin::Base

  def index
    @search_form = Admin::YearSearchForm.new(params[:search])
    @year_managements = @search_form.search.page(params[:page])
  end

  def new
    @year_managements = YearManagement.new
  end

  def show
    @year_managements = YearManagement.find(params[:id])
    render action: 'show'
  end

  def create
    @year_managements = YearManagement.new(year_management_params)
    if @year_managements.save
      flash.notice = '年度情報を登録しました。'
      redirect_to :admin_year_managements
    else
      render action: 'new'
    end
  end

  def edit
    @year_managements = YearManagement.find(params[:id])
  end

  def update
    @year_managements = YearManagement.find(params[:id])
    @year_managements.assign_attributes(year_management_params)
    if @year_managements.save
      flash.notice = '年度情報を編集しました。'
      redirect_to :admin_year_managements
    else
      render action: 'edit'
    end
  end

  def destroy
    year_management = YearManagement.find(params[:id])
    year_management.destroy!
    flash.notice = '年度情報を削除しました。'
    redirect_to :admin_year_managements
  end

  private
  #Strong Parametersによる防御
  def year_management_params
    params.require(:year_management).permit(
      :year, :year_name, :start_date, :end_date,
      :remarks, :slug, :status,
      :created_account_id, :updated_account_id,
      :created_at, :updated_at
    )
  end

end
