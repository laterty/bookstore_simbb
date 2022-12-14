# frozen_string_literal: true

RSpec.describe Cart, type: :model do
  describe 'associations' do
    it do
      is_expected.to have_many(:line_items).dependent(:destroy)
      is_expected.to have_many(:books).through(:line_items)
    end
  end
end
