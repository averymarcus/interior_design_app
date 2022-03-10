require 'rails_helper'

RSpec.describe HomeResource, type: :resource do
  describe 'serialization' do
    let!(:home) { create(:home) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(home.id)
      expect(data.jsonapi_type).to eq('homes')
    end
  end

  describe 'filtering' do
    let!(:home1) { create(:home) }
    let!(:home2) { create(:home) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: home2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([home2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:home1) { create(:home) }
      let!(:home2) { create(:home) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            home1.id,
            home2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            home2.id,
            home1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
