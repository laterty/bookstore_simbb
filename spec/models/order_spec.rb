# frozen_string_literal: true

RSpec.describe Order, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:status).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:stage).of_type(:integer).with_options(null: false) }
  end

  describe 'associations' do
    it do
      is_expected.to belong_to(:user)
      is_expected.to belong_to(:delivery).optional
      is_expected.to have_many(:order_items)
    end
  end
end
