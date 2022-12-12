# frozen_string_literal: true

RSpec.describe OrderItem, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:book_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:order_id).of_type(:integer).with_options(null: false) }
  end

  describe 'associations' do
    it do
      is_expected.to belong_to(:order)
      is_expected.to belong_to(:book)
    end
  end
end
