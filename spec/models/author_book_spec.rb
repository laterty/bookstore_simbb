# frozen_string_literal: true

RSpec.describe AuthorBook, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:author) }
    it { is_expected.to belong_to(:book) }
  end
end
