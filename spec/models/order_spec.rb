# frozen_string_literal: true

RSpec.describe Order, type: :model do
  describe 'associations' do
    it do
      is_expected.to belong_to(:user)
      is_expected.to belong_to(:delivery).optional
      is_expected.to have_many(:order_items)
    end
  end
end
