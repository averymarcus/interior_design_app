require 'rails_helper'

RSpec.describe "homes#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/homes", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'homes',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(HomeResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Home.count }.by(1)
    end
  end
end
