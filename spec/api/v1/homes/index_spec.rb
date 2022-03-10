require 'rails_helper'

RSpec.describe "homes#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/homes", params: params
  end

  describe 'basic fetch' do
    let!(:home1) { create(:home) }
    let!(:home2) { create(:home) }

    it 'works' do
      expect(HomeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['homes'])
      expect(d.map(&:id)).to match_array([home1.id, home2.id])
    end
  end
end
