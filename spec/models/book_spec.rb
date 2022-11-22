# frozen_string_literal: true

RSpec.describe Book, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
  end
end
