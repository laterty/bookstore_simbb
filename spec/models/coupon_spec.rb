# frozen_string_literal: true

RSpec.describe Coupon, type: :model do
  describe 'table' do
    it do
      is_expected.to have_db_column(:code).of_type(:string).with_options(null: false)
      is_expected.to have_db_column(:discount).of_type(:float).with_options(null: false)
      is_expected.to have_db_column(:cart_id).of_type(:integer)
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:cart).optional }
  end

  describe 'table index' do
    it do
      is_expected.to have_db_index(:cart_id)
    end
  end
end
