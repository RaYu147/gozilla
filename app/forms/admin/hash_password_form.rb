class Admin::HashPasswordForm
  include ActiveModel::Model

  attr_accessor :object

  def save
    if valid?
      self.pass = object.password
      object.save!
    end
  end

  def pass=(raw_password)
    if raw_password.kind_of?(String)
      object.password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      object.password = nil
    end
  end
end
