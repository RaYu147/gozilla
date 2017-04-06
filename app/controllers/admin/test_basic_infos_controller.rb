class Admin::TestBasicInfosController < Admin::Base
  def index
    @search_form = Admin::TestSearchForm.new(params[:search])
#    @test_basic_infos = YearManagement.includes(:test_basic_info).references(:test_basic_info).order(:id)
    @test_basic_infos = @search_form.search.page(params[:page])
  end

  def new
    @test_basic_info = TestBasicInfo.new
    @year = YearManagement.find(params[:year_id])
  end

  def edit
    @test_basic_info = TestBasicInfo.find(params[:id])
    @year = YearManagement.find(@test_basic_info.year_management_id)
  end

  def create
    @test_basic_info = TestBasicInfo.new(test_basic_info_params)
    @year = YearManagement.find(@test_basic_info.year_management_id)
    if @test_basic_info.save
      redirect_to :admin_test_basic_infos
    else
      render action: 'new'
    end
  end

  def update
    @test_basic_info = TestBasicInfo.find(params[:id])
    @year = YearManagement.find(@test_basic_info.year_management_id)
    @test_basic_info.assign_attributes(test_basic_info_params)
    if @test_basic_info.save
      redirect_to :admin_test_basic_infos
    else
      render action: 'edit'
    end
  end

  def destroy
    @test_basic_info = TestBasicInfo.find(params[:id])
    @test_basic_info.destroy!
    redirect_to :admin_test_basic_infos
  end

  private
  #Strong Parametersによる防御
  def test_basic_info_params
    params.require(:test_basic_info).permit(
      :year_management_id, :year_id, :question_count,
      :pass_grade, :slug,
      :created_account_id, :updated_account_id,
      :created_at, :updated_at
    )
  end

end
