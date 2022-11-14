# frozen_string_literal: true

require 'rails_helper'
require 'pry'
RSpec.describe 'Homes', type: :request do
  describe 'GET /' do
    let(:books) { create_list(:book, 4) }

    before do
      allow(Book).to receive(:bestsellers).and_return books
    end

    it 'renders :index template' do
      get '/'
      expect(response).to render_template :index
    end

    it 'renders latest_books_item partial' do
      get '/'
      expect(response).to render_template(partial: 'home/_latest_books_item')
    end

    it 'renders book partial' do
      get '/'
      expect(response).to render_template(partial: 'home/_book')
    end
  end
end
