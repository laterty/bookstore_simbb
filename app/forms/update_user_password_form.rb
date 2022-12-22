# frozen_string_literal: true

class UpdateUserPasswordForm < ApplicationForm
  attr_accessor :current_password, :password, :password_confirmation

  validates_presence_of :password, :password_confirmation, :current_password, message: I18n.t('validation.blank')
  validate :old_password_validation
  validate :new_password_confirmation
  validates :password, complexity_format: true

  def save
    return unless valid?

    @model.update(password: @params[:password])
    @model
  end

  private

  def new_password_confirmation
    return if password == password_confirmation

    errors.add :password_confirmation, I18n.t('validation.password.confirmation')
  end

  def old_password_validation
    return if @model.valid_password?(current_password)

    errors.add :current_password, I18n.t('validation.password.current')
  end
end
