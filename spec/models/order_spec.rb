require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it do
      is_expected.to belong_to(:user)
      is_expected.to have_many(:order_items)
      is_expected.to have_one(:billing_address)
      is_expected.to have_one(:shipping_address)
    end
  end
end
