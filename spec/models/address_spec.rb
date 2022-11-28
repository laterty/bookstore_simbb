# frozen_string_literal: true

RSpec.describe Address, type: :model do
  describe 'table' do
    it do
      is_expected.to have_db_column(:first_name).of_type(:string).with_options(null: false)
      is_expected.to have_db_column(:last_name).of_type(:string).with_options(null: false)
      is_expected.to have_db_column(:address).of_type(:string).with_options(null: false)
      is_expected.to have_db_column(:city).of_type(:string).with_options(null: false)
      is_expected.to have_db_column(:country).of_type(:string).with_options(null: false)
      is_expected.to have_db_column(:zip).of_type(:string).with_options(null: false)
      is_expected.to have_db_column(:phone).of_type(:string).with_options(null: false)
      is_expected.to have_db_column(:type).of_type(:string).with_options(null: false)
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
