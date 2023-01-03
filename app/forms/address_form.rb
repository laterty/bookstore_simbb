# frozen_string_literal: true

class AddressForm < ApplicationForm
  attr_accessor :first_name, :last_name, :city, :country, :address, :zip, :phone, :type

  FIRST_NAME_MIN_LENGTH = 3
  FIRST_NAME_MAX_LENGTH = 50

  LAST_NAME_MIN_LENGTH = 3
  LAST_NAME_MAX_LENGTH = 50

  ADDRESS_MIN_LENGTH = 3
  ADDRESS_MAX_LENGTH = 50

  COUNTRY_MIN_LENGTH = 2
  COUNTRY_MAX_LENGTH = 50

  CITY_MIN_LENGTH = 3
  CITY_MAX_LENGTH = 50

  ZIP_MIN_LENGTH = 5
  ZIP_MAX_LENGTH = 10

  PHONE_MIN_LENGTH = 10
  PHONE_MAX_LENGTH = 15

  validates :first_name,
            presence: true,
            format: { with: /\A[a-zA-Z]*\z/,
                      message: I18n.t('validation.address.names_city_country') },
            length: { in: FIRST_NAME_MIN_LENGTH..FIRST_NAME_MAX_LENGTH }

  validates :last_name,
            presence: true,
            format: { with: /\A[a-z A-Z]*\z/,
                      message: I18n.t('validation.address.names_city_country') },
            length: { in: LAST_NAME_MIN_LENGTH..LAST_NAME_MAX_LENGTH }

  validates :city,
            presence: true,
            format: { with: /\A[a-z A-Z-]*\z/,
                      message: I18n.t('validation.address.names_city_country') },
            length: { in: CITY_MIN_LENGTH..CITY_MAX_LENGTH }

  validates :country,
            presence: true,
            format: { with: /\A[a-z A-Z]*\z/,
                      message: I18n.t('validation.address.names_city_country') },
            length: { in: COUNTRY_MIN_LENGTH..COUNTRY_MAX_LENGTH }

  validates :address,
            presence: true,
            format: { with: /\A[a-zA-Z0-9 \-,.]*\z/,
                      message: I18n.t('validation.address.address') },
            length: { in: ADDRESS_MIN_LENGTH..ADDRESS_MAX_LENGTH }

  validates :zip,
            presence: true,
            format: { with: /\A[0-9-]*\z/,
                      message: I18n.t('validation.address.zip') },
            length: { in: ZIP_MIN_LENGTH..ZIP_MAX_LENGTH }

  validates :phone,
            presence: true,
            format: { with: /\+[1-9]{1}[0-9]{3,13}/,
                      message: I18n.t('validation.address.phone') },
            length: { in: PHONE_MIN_LENGTH..PHONE_MAX_LENGTH }
end
