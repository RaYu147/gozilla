require 'rails_helper'

describe Account do
  describe '#pass=' do

    example 'p.145<パスワード暗号化>文字列を与えると、passwordは長さ60の文字列になる' do
      account = Account.new
      account.pass = 'ga'
      expect(account.password).to be_kind_of(String)
      expect(account.password.size).to eq(60)
    end

    example '<パスワード暗号化>nilを与えると、passwordはnilになる' do
      account = Account.new(password: 'x')
      account.pass = nil
      expect(account.password).to be_nil
    end
  end
end
