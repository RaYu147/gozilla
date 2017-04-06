class Admin::TestSearchForm
  include ActiveModel::Model
  include HtmlBuilder

  attr_accessor :year_name

  def search
    rel = YearManagement.order(:year)

    if year_name.present?
      rel = rel.where("year_name like '%" + year_name + "%'")
    end
    rel.order(:year_name)
  end
end
