require 'rails_helper'

RSpec.describe "rooming_lists#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/rooming_lists/#{rooming_list.id}", params: params
  end

  describe 'basic fetch' do
    let!(:rooming_list) { create(:rooming_list) }

    it 'works' do
      expect(RoomingListResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('rooming_lists')
      expect(d.id).to eq(rooming_list.id)
    end
  end
end
