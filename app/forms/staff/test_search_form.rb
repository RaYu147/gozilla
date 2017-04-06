class Staff::TestSearchForm
  include ActiveModel::Model
  include HtmlBuilder

  attr_accessor :year_name, :exam_complete_date

  def search(current_account)
    rel = TestBasicInfo.joins(:year_management)
    p rel
    if year_name.present?
      rel = rel.where("year_managements.year_name like '%" + year_name + "%'")
    end
    p rel
  end
end
