# frozen_string_literal: true

RSpec.describe 'Homes', type: :request do
  before { Category::NAMES.each { Category.create(name: _1) } }

  describe 'GET /' do
    before do
      create_list(:book, 4)
      get '/'
    end

    it { expect(response).to render_template :index }
    it { expect(response).to render_template(partial: 'home/_latest_books_item') }
    it { expect(response).to render_template(partial: 'home/_book') }
  end
end
