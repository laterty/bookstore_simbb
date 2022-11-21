# frozen_string_literal: true

RSpec.describe Book, type: :model do
  describe 'validations' do
    let(:book) { create(:book) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
  end
end
