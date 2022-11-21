# frozen_string_literal: true

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

    errors.add :password, I18n.t('validation.password.complexity')
  end

  def new_password_confirmation
    return if password == password_confirmation

    errors.add :password_confirmation, I18n.t('validation.password.confirmation')
  end

  def old_password_validation
    return if @model.valid_password?(current_password)

    errors.add :current_password, I18n.t('validation.password.current')
  end
end
