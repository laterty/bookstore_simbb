# frozen_string_literal: true

RSpec.describe Book, type: :model do
  describe 'table' do
    it do
      is_expected.to have_db_column(:title).of_type(:string).with_options(null: false)
      is_expected.to have_db_column(:description).of_type(:text).with_options(null: false)
      is_expected.to have_db_column(:price).of_type(:decimal).with_options(null: false)
      is_expected.to have_db_column(:year_of_publication).of_type(:string).with_options(null: false)
      is_expected.to have_db_column(:materials).of_type(:string).with_options(null: false)
      is_expected.to have_db_column(:dimensions).of_type(:string).with_options(null: false)
      is_expected.to have_db_column(:category_id).of_type(:integer).with_options(null: false)
      is_expected.to have_db_column(:quantity).of_type(:integer).with_options(null: false)
    end
  end

  describe 'validations' do
    it do
      is_expected.to validate_presence_of(:title)
      is_expected.to validate_presence_of(:description)
      is_expected.to validate_presence_of(:price)
      is_expected.to validate_presence_of(:year_of_publication)
      is_expected.to validate_presence_of(:materials)
      is_expected.to validate_presence_of(:dimensions)
      is_expected.to validate_presence_of(:quantity)
    end
  end

  describe 'associations' do
    it do
      is_expected.to belong_to(:category)
      is_expected.to have_many(:author_books).dependent(:destroy)
      is_expected.to have_many(:authors).through(:author_books)
    end
  end
end
