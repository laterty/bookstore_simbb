class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  has_one :billing_address, dependent: :destroy
  has_one :shipping_address, dependent: :destroy
end
