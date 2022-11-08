class UpdateUserPasswordForm < ApplicationForm
  attr_accessor :current_password, :password, :password_confirmation

  validate :password_validation

  def save
    return unless valid?

    @model.update(password: @params[:password])
    @model
  end

  private

  def password_validation
    new_password_confirmed? && old_password_valid?
  end

  def new_password_confirmed?
    password == password_confirmation
  end

  def old_password_valid?
    @model.valid_password?(current_password)
  end
end
