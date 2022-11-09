class UpdateUserPasswordForm < ApplicationForm
  attr_accessor :current_password, :password, :password_confirmation

  validates :password, :password_confirmation, :current_password, presence: true
  validate :old_password_validation
  validate :new_password_confirmation
  validate :password_complexity

  def save
    return unless valid?
 
    @model.update(password: @params[:password])
    @model
  end

  private

  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/

    errors.add :password,
               'Complexity requirement not met. Please use: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end

  def new_password_confirmation
    errors.add :password_confirmation, 'Password confirmation should be the same with new password' unless password == password_confirmation
  end

  def old_password_validation
    errors.add :current_password, 'Wrong current password' unless @model.valid_password?(current_password)
  end
end
