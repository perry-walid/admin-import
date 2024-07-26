require 'rails_helper'

RSpec.describe RoomingListResource, type: :resource do
  describe 'serialization' do
    let!(:rooming_list) { create(:rooming_list) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(rooming_list.id)
      expect(data.jsonapi_type).to eq('rooming_lists')
    end
  end

  describe 'filtering' do
    let!(:rooming_list1) { create(:rooming_list) }
    let!(:rooming_list2) { create(:rooming_list) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: rooming_list2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([rooming_list2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:rooming_list1) { create(:rooming_list) }
      let!(:rooming_list2) { create(:rooming_list) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            rooming_list1.id,
            rooming_list2.id
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
            rooming_list2.id,
            rooming_list1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
