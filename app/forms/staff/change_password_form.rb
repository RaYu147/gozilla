class Staff::ChangePasswordForm
  include ActiveModel::Model

  attr_accessor :object, :current_password, :new_password, :new_password_confirmation
  validates :current_password, presence: true
  validates :new_password_confirmation, presence: true
  validates :new_password, presence: true, confirmation: true

  validate do
    unless Staff::Authenticator.new(object).authenticate(current_password)
      errors.add(:current_password, :wrong)
    end
  end

  validate do
    errors.add(:new_password, :wrong) if current_password == new_password
  end

  def save
    if valid?
      object.pass = new_password
      object.save!
    end
  end
end
