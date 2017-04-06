FactoryGirl.define do
  factory :account do
    authority_category 1
    login_id '1'
    pass 'pw'
    account_name '新井'
    sequence(:mail_address){ |n| "member#{n}@example.com" }
    remarks 'Account_remarks1'
    slug 'Ac1'
    status 1
    created_account_id 1
    updated_account_id 1
    created_at Date.today
    updated_at Date.today
  end
end
