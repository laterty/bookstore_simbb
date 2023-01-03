# frozen_string_literal: true

class Order < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :delivery, optional: true

  has_many :order_items, dependent: :destroy

  has_one :billing_address, dependent: :destroy
  has_one :shipping_address, dependent: :destroy
  has_one :credit_card, dependent: :destroy

  enum status: { unprocessed: 0, in_progress: 1, in_delivery: 2, delivered: 3, canceled: 4 }
  enum stage: { address: 0, delivery: 1, payment: 2, confirm: 3, complete: 4 }

  aasm column: :stage, enum: true do
    state :address, initial: true
    state :delivery
    state :payment
    state :confirm
    state :complete

    event :to_delivery do
      transitions from: :address, to: :delivery
    end

    event :to_payment do
      transitions from: :delivery, to: :payment
    end

    event :to_confirm do
      transitions from: :payment, to: :confirm
    end

    event :to_complete do
      transitions from: :confirm, to: :complete
    end
  end
end
