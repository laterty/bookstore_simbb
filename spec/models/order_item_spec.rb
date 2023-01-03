# frozen_string_literal: true

RSpec.describe OrderItem, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:quantity).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:price).of_type(:decimal).with_options(null: false) }
  end

  describe 'associations' do
    it do
      is_expected.to belong_to(:order)
      is_expected.to belong_to(:book).optional
    end
  end
end
