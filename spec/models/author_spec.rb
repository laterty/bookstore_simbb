# frozen_string_literal: true

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:books).through(:author_books) }
    it { is_expected.to have_many(:author_books).dependent(:destroy) }
  end
end
