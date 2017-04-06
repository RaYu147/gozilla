class Staff::CheckstaffsSearchForm
  include ActiveModel::Model

  attr_accessor :account_name, :year_name

  def search
    rel = Account.order(:id)
    if account_name.present?
      rel = rel.where(account_name: account_name)
    end

    rel.order(:login_id)
  end

  def test_basic_info_id
    test_basic_info = TestBasicInfo.includes(:year_management).references(:year_management)
    if year_name.present?
      test_basic_info = test_basic_info.where("year_managements.year_name = '" + year_name + "'")
      if test_basic_info.present?
        test_basic_info.each do |m|
          return rel = m.id
        end
      else
        rel = 0
      end
    else
      rel = nil
    end
  end
end
