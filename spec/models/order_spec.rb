# frozen_string_literal: true

RSpec.describe Order, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
  end

  describe 'associations' do
    it do
      is_expected.to have_many(:line_items).dependent(:destroy)
      is_expected.to belong_to(:user)
    end
  end
end
