# frozen_string_literal: true

RSpec.describe CreditCard, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:number).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:expire_date).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:cvv).of_type(:string).with_options(null: false) }
  end

  describe 'associations' do
    it do
      is_expected.to belong_to(:order).optional
    end
  end
end
