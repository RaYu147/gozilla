class Staff::StaffSearchForm <
  include ActiveModel::Model
  include HtmlBuilder

  attr_accessor :year_name, :accont_name

  def search
    rel = Account.order(:id)
  end
end
