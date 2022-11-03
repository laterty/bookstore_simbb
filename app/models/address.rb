class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :first_name, :last_name, :city, :country,
            presence: true,
            format: { with: /\A[a-zA-Z]*\z/,
                      message: 'Consist of a-z, A-Z only, no special symbols' },
            length: { maximum: 50 }

  validates :address,
            presence: true,
            format: { with: /\A[a-zA-Z0-9 \-,]*\z/,
                      message: 'Consist of a-z, A-Z, 0-9,’,’, ‘-’, ‘ ’ only, \
                      no special symbols' },
            length: { maximum: 50 }

  validates :zip,
            presence: true,
            format: { with: /\A[0-9\-]*\z/,
                      message: 'Consist of 0-9 only,’-’ no special symbols' },
            length: { maximum: 10 }

  validates :phone,
            presence: true,
            format: { with: /\A\+[0-9]*\z/,
                      message: 'Consist of 0-9 only no special symbols' },
            length: { maximum: 15 }

  def self.inheritance_column
    'inheritance_type'
  end
end
