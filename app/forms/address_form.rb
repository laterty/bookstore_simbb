# frozen_string_literal: true

class AddressForm < ApplicationForm
  attr_accessor :first_name, :last_name, :city, :country, :address, :zip, :phone, :type

  validates :first_name, :last_name, :city, :country,
            presence: true,
            format: { with: /\A[a-zA-Z]*\z/,
                      message: I18n.t('validation.address.names_city_country') },
            length: { maximum: 50 }

  validates :address,
            presence: true,
            format: { with: /\A[a-zA-Z0-9 \-,]*\z/,
                      message: I18n.t('validation.address.address') },
            length: { maximum: 50 }

  validates :zip,
            presence: true,
            format: { with: /\A[0-9\-]*\z/,
                      message: I18n.t('validation.address.zip') },
            length: { maximum: 10 }

  validates :phone,
            presence: true,
            format: { with: /\A\+[0-9]*\z/,
                      message: I18n.t('validation.address.phone') },
            length: { maximum: 15 }
end
