# frozen_string_literal: true

RSpec.describe User, type: :model do
  let(:user_build) { build(:user) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe '.from_omniauth' do
    let(:auth) { OmniAuth::AuthHash.new(Faker::Omniauth.facebook) }
    let(:user) { described_class.from_omniauth(auth) }

    let(:user_uid) { user.uid }
    let(:auth_uid) { auth.uid }

    it { expect(user_uid).to eq auth_uid }
  end
end
