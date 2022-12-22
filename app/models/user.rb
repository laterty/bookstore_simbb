# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_one :billing_address, dependent: :destroy
  has_one :shipping_address, dependent: :destroy

  validates :email, :password, presence: true
  validates :password, complexity_format: true
end
