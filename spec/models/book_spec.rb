# frozen_string_literal: true

RSpec.describe Book, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end
end
