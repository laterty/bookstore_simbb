# frozen_string_literal: true

RSpec.describe Book, type: :model do
  describe 'validations' do
    let(:book) { create(:book) }

    it { is_expected.to validate_presence_of(:title) }
  end
end
