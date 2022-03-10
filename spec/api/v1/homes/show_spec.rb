require 'rails_helper'

RSpec.describe "homes#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/homes/#{home.id}", params: params
  end

  describe 'basic fetch' do
    let!(:home) { create(:home) }

    it 'works' do
      expect(HomeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('homes')
      expect(d.id).to eq(home.id)
    end
  end
end
