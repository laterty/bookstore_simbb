class Order < ApplicationRecord
  belongs_to :user
  belongs_to :delivery, optional: true

  has_many :order_items, dependent: :destroy

  has_one :billing_address, dependent: :destroy
  has_one :shipping_address, dependent: :destroy
  has_one :credit_card, dependent: :destroy
end
