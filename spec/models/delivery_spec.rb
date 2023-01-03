require 'rails_helper'

RSpec.describe Delivery, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:price).of_type(:decimal).with_options(null: false) }
  end

  describe 'associations' do
    it do
      is_expected.to belong_to(:cart)
      is_expected.to belong_to(:book)
    end
  end
end
