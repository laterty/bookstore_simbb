class UpdateUserPasswordForm < ApplicationForm
  attr_accessor :current_password, :password, :password_confirmation

  validate :password_validation
  validate :password_complexity

  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/

    errors.add :password,
               'Complexity requirement not met. Please use: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end

  def password_validation
    password_attributes_not_blank && new_password_confirmed && old_password_valid
  end

  def save
    return unless valid?

    @model.update(password: @params[:password])
    @model
  end

  private

  def password_attributes_not_blank
    return if current_password.present? && password.present? && password_confirmation.present?

    errors.add :password, 'Cant be blank'
  end

  def new_password_confirmed
    errors.add :password, 'Password confirmation should be the same with new password' unless password == password_confirmation
  end

  def old_password_valid
    errors.add :current_password, 'Wrong current password' unless @model.valid_password?(current_password)
  end

end
