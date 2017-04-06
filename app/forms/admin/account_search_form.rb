class Admin::AccountSearchForm
  include ActiveModel::Model
  include HtmlBuilder

  attr_accessor :account_name

  def search
    rel = Account.order(:id)

    if account_name.present?
      rel = rel.where("account_name like '%" + account_name + "%'")
    end
    rel.order(:account_name)
  end
end
