class YearManagement < ActiveRecord::Base
  belongs_to :account, class_name: 'Account', foreign_key: 'created_account_id' 'updated_account_id'
  has_one :test_basic_info, class_name: 'TestBasicInfo', dependent: :destroy
end
