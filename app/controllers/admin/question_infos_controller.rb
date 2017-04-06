class Admin::QuestionInfosController < Admin::Base
  # chap11 参照

  def index
    # 9/13 arai
    @search_form = Admin::QuestionInfoSearchForm.new(params[:search]) # 検索フォーム p490
    @question_infos = @search_form.search.page(params[:page])
    ###
  end

  def show
    @infos = QuestionInfo.find(params[:id])
    @question_info_and_choice = QuestionInfo.joins(:question_choice_infos).select('*').where(id: @infos.id)
  end

  def new
    @question_info_count = QuestionInfo.last
    @question_count = params[:question_count]
    @question_info = QuestionInfo.new
    (@question_count).to_i.times do |count|
      @question_info.question_choice_infos.build(choice_number: count+1)
    end

  end

  def edit
    @question_info = QuestionInfo.find(params[:id])
  end

  def delete
    @question_info_and_choice = QuestionInfo.joins(:question_choice_infos).find(params[:id])
  end

  def create  # p.226 arai
    # 9/26 arai
    # 送られてきたquestion_choice_info.choice_numberのcorrect_statusだけ1
    @question_info = QuestionInfo.new(question_info_params)
    @question_count = @question_info.question_count
    @question_info.question_choice_infos.each do |q|
      if (params[:correct_status_number]).to_i == (q.choice_number).to_i
        q.correct_status = 1
      end
    end
    if @question_info.save
      flash.notice = '追加しました。'
      redirect_to :admin_question_infos
    else
      render action: 'new', val: @question_count
    end
  end


  def update
    @question_info = QuestionInfo.find(params[:id])
    @question_info.assign_attributes(question_info_params)
    # 送られてきたquestion_choice_info.choice_numberのcorrect_statusだけ1
    @question_info.question_choice_infos.each do |q|
      if (params[:correct_status_number]).to_i == (q.choice_number).to_i
        q.correct_status = 1
      end
    end
    if @question_info.save
      flash.notice = '編集しました。'
      redirect_to :admin_question_infos
    else
      render action: 'edit'
    end
  end

  def destroy # p.229 9/21 arai
    question_info = QuestionInfo.find(params[:id])
    question_info.destroy!
    flash.notice = '削除しました。'
    redirect_to :admin_question_infos
  end

  private
  def question_info_params
    params.require(:question_info).permit(
      :id, :question_contents, :question_count, :slug, :status,
      :created_account_id, :updated_account_id,
       question_choice_infos_attributes:
      [ :id, :question_info_id, :choice_number, :choice_contents, :correct_status,
        :slug, :status, :created_account_id, :updated_account_id ]
    )
  end

end
