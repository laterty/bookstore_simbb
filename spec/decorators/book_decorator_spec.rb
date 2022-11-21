# frozen_string_literal: true

RSpec.describe BookDecorator do
  describe '#all_authors' do
    before { Category::NAMES.each { Category.create(name: _1) } }
    let(:author1) { create(:author) }
    let(:author2) { create(:author) }
    let(:book) { create(:book, authors: [author1, author2]) }
    let(:result) { book.decorate.authors_names }
    let(:expected_result) { "#{author1.name},#{author2.name}" }

    it { expect(result).to eq(expected_result) }
  end
end
