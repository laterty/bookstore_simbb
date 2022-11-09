require 'rails_helper'

=begin
RSpec.describe 'Addresses', type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET /index' do
    it 'returns http success' do
      log_in(user)
      get '/settings/address/edit'
      expect(response).to have_http_status(:success)
    end
  end
end
=end
