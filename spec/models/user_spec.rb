# frozen_string_literal: true

RSpec.describe User, type: :model do
  let(:user_build) { build(:user) }

  describe 'validations' do
    it do
      is_expected.to validate_presence_of(:email)
      is_expected.to validate_presence_of(:password)
    end
  end

  describe 'table' do
    it do
      is_expected.to have_db_column(:email).of_type(:string).with_options(null: false)
      is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(null: false)
    end
  end

  describe 'table index' do
    it do
      is_expected.to have_db_index(:email)
      is_expected.to have_db_index(:reset_password_token)
    end
  end
end
