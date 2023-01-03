# frozen_string_literal: true

RSpec.describe Delivery, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:price).of_type(:decimal).with_options(null: false) }
  end
end
