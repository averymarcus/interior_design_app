require 'rails_helper'

RSpec.describe HomeResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'homes',
          attributes: { }
        }
      }
    end

    let(:instance) do
      HomeResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Home.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:home) { create(:home) }

    let(:payload) do
      {
        data: {
          id: home.id.to_s,
          type: 'homes',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      HomeResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { home.reload.updated_at }
      # .and change { home.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:home) { create(:home) }

    let(:instance) do
      HomeResource.find(id: home.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Home.count }.by(-1)
    end
  end
end
