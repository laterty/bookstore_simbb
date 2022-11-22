# frozen_string_literal: true

RSpec.describe 'Homes', type: :request do
  describe 'GET /' do
    before do
      create_list(:book, 4)
      get '/'
    end

    it do
      expect(response).to render_template :index
      expect(response).to render_template(partial: 'home/_latest_books_item')
      expect(response).to render_template(partial: 'home/_book')
    end
  end
end
