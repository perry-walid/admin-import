require 'rails_helper'

RSpec.describe EventUserResource, type: :resource do
  describe 'serialization' do
    let!(:event_user) { create(:event_user) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(event_user.id)
      expect(data.jsonapi_type).to eq('event_users')
    end
  end

  describe 'filtering' do
    let!(:event_user1) { create(:event_user) }
    let!(:event_user2) { create(:event_user) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: event_user2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([event_user2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:event_user1) { create(:event_user) }
      let!(:event_user2) { create(:event_user) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            event_user1.id,
            event_user2.id
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
            event_user2.id,
            event_user1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
