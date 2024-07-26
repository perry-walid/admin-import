require 'rails_helper'

RSpec.describe "rooming_lists#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/rooming_lists/#{rooming_list.id}"
  end

  describe 'basic destroy' do
    let!(:rooming_list) { create(:rooming_list) }

    it 'updates the resource' do
      expect(RoomingListResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { RoomingList.count }.by(-1)
      expect { rooming_list.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
