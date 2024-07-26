require 'rails_helper'

RSpec.describe "rooming_lists#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/rooming_lists", payload
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
          type: 'rooming_lists',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(RoomingListResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { RoomingList.count }.by(1)
    end
  end
end
