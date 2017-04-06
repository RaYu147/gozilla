class Admin::Authenticator
  def initialize(account)
    @account = account
  end

  def authenticate(raw_password)
    @account &&
     @account.authority_category == 1 &&
     @account.password &&
     @account.status == 1 &&
     BCrypt::Password.new(@account.password) == raw_password
  end
end
