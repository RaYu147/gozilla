class Admin::TestInfosController < Admin::Base
  def index
    @test_infos = TestInfo.includes(:question_info).where(test_basic_info_id: params[:test_basic_info_id]).order(:question_number)
    @count = TestBasicInfo.find(params[:test_basic_info_id])
  end

  def new
    @search_form = Admin::QuestionSearchForm.new(params[:search])
    @test_info = TestInfo.new
    if params[:question_number] && params[:test_basic_info_id]
      @question_number = params[:question_number]
      @test_basic_info = TestBasicInfo.includes(:year_management).find(params[:test_basic_info_id])
    else
      @question_number = @search_form.search_question_number
      @test_basic_info = TestBasicInfo.includes(:year_management).find(@search_form.search_test_basic_info_id)
    end
    @question_infos = @search_form.search
  end

  def edit
    @search_form = Admin::QuestionSearchForm.new(params[:search])
    @test_info = TestInfo.find(params[:id])
    @test_basic_info = TestBasicInfo.includes(:year_management).find(@test_info.test_basic_info_id)
    if params[:question_number]
      @question_number = params[:question_number]
    else
      @question_number = @search_form.search_question_number
    end
    @question_infos = @search_form.search
  end

  def create
    @test_info = TestInfo.new(test_info_params)
    if @test_info.save
      redirect_to controller: 'test_infos', action: 'index', test_basic_info_id: @test_info.test_basic_info_id
    else
      render action: 'new'
    end
  end

  def update
    @test_info = TestInfo.find(params[:id])
    @test_info.assign_attributes(test_info_params)
    if @test_info.save
      redirect_to controller: 'test_infos', action: 'index', test_basic_info_id: @test_info.test_basic_info_id
    else
      render action: 'edit'
    end
  end

  def destroy
    @test_info = TestInfo.find(params[:id])
    @test_info.destroy!
    redirect_to controller: 'test_infos', action: 'index', test_basic_info_id: @test_info.test_basic_info_id
  end

  private
  #Strong Parametersによる防御
  def test_info_params
    params.require(:test_info).permit(
      :test_basic_info_id, :question_info_id,
      :question_number, :slug,
      :created_account_id, :updated_account_id,
      :created_at, :updated_at
    )
  end

  def year_management_id_params
    params.require(:year_management).permit(
      :id
    )
  end

end
