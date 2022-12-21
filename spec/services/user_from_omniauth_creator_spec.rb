# frozen_string_literal: true

RSpec.describe UserFromOmniauthCreator do
  describe '#call' do
    let(:auth) { OmniAuth::AuthHash.new(Faker::Omniauth.facebook) }
    let(:user) { described_class.call(auth) }

    let(:user_uid) { user.uid }
    let(:auth_uid) { auth.uid }

    it { expect(user_uid).to eq auth_uid }
  end
end
