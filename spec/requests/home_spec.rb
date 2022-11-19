# frozen_string_literal: true

require 'rails_helper'
require 'pry'
RSpec.describe 'Homes', type: :request do
  before { Category::NAMES.each { Category.create(name: _1) } }

  describe 'GET /' do
    let(:books) { create_list(:book, 4) }

    it 'renders :index template' do
      get '/'
      expect(response).to render_template :index
    end
  end
end
