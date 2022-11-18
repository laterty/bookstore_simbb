# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
  describe 'GET /index' do
    before { get '/books' }

    it { is_expected.to render_template('index') }

    it { expect(response).to have_http_status(:success) }
  end

  describe 'GET /show' do
    before do
      Category::NAMES.each { Category.create(name: _1) }
      get "/books/#{book.id}"
    end

    let(:book) { create(:book) }

    it { is_expected.to render_template :show }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
