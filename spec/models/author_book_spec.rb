# frozen_string_literal: true

RSpec.describe AuthorBook, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:author) }
    it { is_expected.to belong_to(:book) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:book_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:author_id).of_type(:integer).with_options(null: false) }
  end

  describe 'table index' do
    it { is_expected.to have_db_index(%i[author_id book_id]) }
  end
end
