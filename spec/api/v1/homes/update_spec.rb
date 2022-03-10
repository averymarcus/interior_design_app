require 'rails_helper'

RSpec.describe "homes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/homes/#{home.id}", payload
  end

  describe 'basic update' do
    let!(:home) { create(:home) }

    let(:payload) do
      {
        data: {
          id: home.id.to_s,
          type: 'homes',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(HomeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { home.reload.attributes }
    end
  end
end
