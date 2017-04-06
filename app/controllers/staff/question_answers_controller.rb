class Staff::QuestionAnswersController < Staff::Base
  include HtmlBuilder

  def add
    @exam_info = ExamInfo.new(account_id: @current_account.id, exam_count: 1, test_basic_info_id: params[:test_basic_info_id])
    @exam_info.save!

    redirect_to new_staff_question_answer_path(exam_info_id: @exam_info.id)
  end

  def up
    @exam_info_id = params[:exam_info_id]
    redirect_to new_staff_question_answer_path(exam_info_id: @exam_info_id)
  end

  def new
    @exam_info_id = params[:exam_info_id]
    @test_basic_info_id = ExamInfo.find(@exam_info_id).test_basic_info_id
    @test_basic_info = TestBasicInfo.find(@test_basic_info_id)
    @test_info = TestInfo.includes(:question_info).where(test_basic_info_id: @test_basic_info_id).order(:question_number)
    @year_name = YearManagement.find(@test_basic_info.year_management_id).year_name
  end

  def create
    test_info = params[:test_info_id]
    choice = params[:choice]
    exam_info_id = params[:exam_info_id][0]
    exam_info = ExamInfo.find(exam_info_id)

    if exam_info.present?
      exam_info.exam_complete_date = Date.today
      test_info.size.times do |m|
        exam_info.exam_answer.build(
          test_info_id: test_info[m],
          question_choice_info_id: choice[m.to_s]
        )
      end
    else
      redirect_to new_staff_question_answer_path(exam_info_id: exam_info_id)
    end

    exam_info.save

    question_count = ExamAnswer.includes(:question_choice_info).where(exam_info_id: exam_info_id)
    find = ExamInfo.includes(:test_basic_info).find(exam_info_id)
    pass = find.test_basic_info.pass_grade

    my_score = 0
    question_count.each do |m|
      if m.question_choice_info.correct_status == 1
        my_score += 1;
      end
    end

    if my_score < pass
      new_exam_info = ExamInfo.new(account_id: @current_account.id, exam_count: exam_info.exam_count + 1, test_basic_info_id: find.test_basic_info.id)
      new_exam_info.save
      p 'tuika'
    end

    redirect_to staff_resultmark_path(exam_info_id: exam_info_id)
  end
end
