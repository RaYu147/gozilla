class Staff::ResultmarksController < Staff::Base
  def show

    @param_exam_info =  params[:exam_info_id]
    @extraction_test_info_id = ExamAnswer.joins(:test_info)
                              .where(exam_answers: {exam_info_id: @param_exam_info }).first
    @extraction_test_basic_info_id = TestInfo.find(@extraction_test_info_id.test_info_id)



    # 年度
    @year_managements = ExamInfo.joins({:exam_answer =>
                        {:test_info => {:test_basic_info =>:year_management}}})
                        .select('year_managements.year_name')
                        .find(@param_exam_info)

    # 満点
    @perfect_score = TestBasicInfo
                    .find(@extraction_test_basic_info_id.test_basic_info_id)

    # 自分の得点
    score = ExamAnswer.joins(:question_choice_info).select("*")
            .where(exam_answers: {exam_info_id: @param_exam_info })

    @my_score = 0
    score.each do |n|
      @my_score = @my_score + n.question_choice_info.correct_status
    end

    # 自分の回答
    @answer = ExamAnswer.joins(:test_info).joins(:question_choice_info)
            .find_by( exam_info_id: @param_exam_info )

    # テーブル設問情報+選択肢情報　...test_basic_info_idでしぼる
    @all_question = TestInfo.joins(:question_info).joins(:test_basic_info)
                    .where(test_infos: {test_basic_info_id:
                    @extraction_test_basic_info_id.test_basic_info_id })
                    .select("*").order(:question_number)

    @answer_test = ExamAnswer.joins(:question_choice_info).select("*")
                  .where(exam_answers: {exam_info_id: @param_exam_info })

    # @answer_test = ExamAnswer.includes(:question_choice_info)
    #               .where(exam_info_id: @param_exam_info)

  end
end
