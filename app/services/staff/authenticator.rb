 class Staff::Authenticator
  def initialize(account)
    @account = account
  end

  def authenticate(raw_password)
    @account &&
      @account.password &&
      @account.status == 1 &&
      BCrypt::Password.new(@account.password) == raw_password
    end
  end
