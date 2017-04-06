class Staff::CheckmytestController < Staff::Base
  # before_action :authorize

  def index
    @search_form = Staff::TestSearchForm.new(params[:search])
    @checkmytest = @search_form.search(current_account)
    #.page(params[:page])
  end

  # private
  # def authorize
  #   unless current_account
  #     redirect_to :staff_login
  #   end
  # end
end
