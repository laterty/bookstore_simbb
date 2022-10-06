require 'rails_helper'
require 'pry'
RSpec.describe "Homes", type: :request do
  describe "GET /" do
    let(:books) { create_list(:book, 4) }
    before do
      allow(Book).to receive(:bestsellers).and_return books
    end

    it 'renders :index template' do
      get '/'
      expect(response).to render_template :index
    end
  end
end
