# frozen_string_literal: true

class ComplexityFormatValidator < ActiveModel::EachValidator
  PASSWORD_REGEX = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/

  def validate_each(record, _password, password_value)
    return if password_value.blank? || password_value =~ PASSWORD_REGEX

    record.errors.add :password, I18n.t('devise.passwords.complexity_error')
  end
end
