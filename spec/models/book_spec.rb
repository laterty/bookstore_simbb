# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  before { Category::NAMES.each { Category.create(name: _1) } }

  context 'when create book' do
    let(:book) { create(:book) }

    it 'is valid with valid attributes' do
      expect(book).to be_valid
    end

    it 'is not valid without a title' do
      book.title = nil
      expect(book).not_to be_valid
    end

    it 'is not valid without a description' do
      book.description = nil
      expect(book).not_to be_valid
    end

    it 'is not valid without a price' do
      book.price = nil
      expect(book).not_to be_valid
    end

    it 'is not valid with a text price' do
      book.price = 'text_price'
      expect(book).not_to be_valid
    end
  end
end
