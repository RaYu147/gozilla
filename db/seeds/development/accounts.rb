account_name = %w{
  佐藤花子:sato
  鈴木良子:suzuki
  高橋愛子:takahashi
  田中雅子:tanaka
  渡辺太郎:watanabe
  伊藤二郎:ito
  山本義雄:yamamoto
  中村アン:nakamura
  小林卓美:konabashi
  加藤ジャイコ:kato
}


# 管理者
Account.create!(
  authority_category: 1,
  login_id: 1,
  pass: 'password',
  account_name: '管理者',
  mail_address: "kanri@example.com",
  remarks: '備考',
  slug: 'Account',
  status: 1,
  created_account_id: 1,
  updated_account_id: 1,
  created_at: Date.today,
  updated_at: Date.today
)

# 社員
10.times do |n|
  name = account_name[n].split(':')

  Account.create!(
    authority_category: 2,
    login_id: (n+2),
    pass: 'password',
    account_name: name[0],
    mail_address: "#{name[1]}@example.com",
    remarks: '備考',
    slug: 'Account',
    status: 1,
    created_account_id: 1,
    updated_account_id: 1,
    created_at: Date.today,
    updated_at: Date.today
  )
end
