require 'rails_helper'

RSpec.describe "rooming_lists#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/rooming_lists", params: params
  end

  describe 'basic fetch' do
    let!(:rooming_list1) { create(:rooming_list) }
    let!(:rooming_list2) { create(:rooming_list) }

    it 'works' do
      expect(RoomingListResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['rooming_lists'])
      expect(d.map(&:id)).to match_array([rooming_list1.id, rooming_list2.id])
    end
  end
end
