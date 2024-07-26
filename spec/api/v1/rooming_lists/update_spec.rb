require 'rails_helper'

RSpec.describe "rooming_lists#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/rooming_lists/#{rooming_list.id}", payload
  end

  describe 'basic update' do
    let!(:rooming_list) { create(:rooming_list) }

    let(:payload) do
      {
        data: {
          id: rooming_list.id.to_s,
          type: 'rooming_lists',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(RoomingListResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { rooming_list.reload.attributes }
    end
  end
end
