# 20.times do |n|
#   year = 2010 + n
#
#   YearManagement.create!(
#     year: year,
#     year_name: "#{year}年度",
#     start_date: Date.today,
#     end_date: Date.today,
#     remarks: '備考',
#     slug: 'YeMa',
#     status: 1,
#     created_account_id: 1,
#     updated_account_id: 1,
#     created_at: Date.today,
#     updated_at: Date.today
#   )
# end
#デモ用 2つ作成
YearManagement.create!(
  year: 2016,
  year_name: "19期",
  start_date: DateTime.new(2015,10,1,00,00,00),
  end_date: DateTime.new(2016,9,30,00,00,00),
  remarks: '特になし',
  slug: '19-2',
  status: 1,
  created_account_id: 1,
  updated_account_id: 1,
  created_at: Date.today,
  updated_at: Date.today
)
YearManagement.create!(
  year: 2017,
  year_name: "20期",
  start_date: DateTime.new(2016,10,1,00,00,00),
  end_date: DateTime.new(2017,9,30,00,00,00),
  remarks: '特になし',
  slug: '20-1',
  status: 1,
  created_account_id: 1,
  updated_account_id: 1,
  created_at: Date.today,
  updated_at: Date.today
)
