require 'rails_helper'

describe Staff::Authenticator do
  describe '#authenticate' do
    example 'p176<ログイン条件の判定確認>正しいパスワードならtureを返す' do
      m = build(:account)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be_truthy
    end

    example '誤ったパスワードならfalseを返す' do
      m = build(:account)
      expect(Staff::Authenticator.new(m).authenticate('xy')).to be_falsey
    end
    example 'パスワードが未設定ならfalseを返す' do
      m = build(:account, password: nil)
      expect(Staff::Authenticator.new(m).authenticate(nil)).to be_falsey
    end

    example '停止フラグが立っていればfalseを返す' do
      m = build(:account, status: 0)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be_falsey
      #expect(Staff::SessionsController.new(m).create).to be_falsy
    end


  end
end
