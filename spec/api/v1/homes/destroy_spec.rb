require 'rails_helper'

RSpec.describe "homes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/homes/#{home.id}"
  end

  describe 'basic destroy' do
    let!(:home) { create(:home) }

    it 'updates the resource' do
      expect(HomeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Home.count }.by(-1)
      expect { home.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
