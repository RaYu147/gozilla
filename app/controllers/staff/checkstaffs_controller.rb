class Staff::CheckstaffsController < Staff::Base
  include HtmlBuilder

  def index
    @search_form = Staff::CheckstaffsSearchForm.new(params[:search])
    @checksttafstest = @search_form.search
    @test_basic_info_id = @search_form.test_basic_info_id
  end
end
