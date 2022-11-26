# frozen_string_literal: true

RSpec.describe AuthorBook, type: :model do
  describe 'associations' do
    it do
      is_expected.to belong_to(:author)
      is_expected.to belong_to(:book)
    end
  end

  describe 'columns' do
    it do
      is_expected.to have_db_column(:book_id).of_type(:integer).with_options(null: false)
      is_expected.to have_db_column(:author_id).of_type(:integer).with_options(null: false)
    end
  end

  describe 'table index' do
    it { is_expected.to have_db_index(%i[author_id book_id]) }
  end
end
