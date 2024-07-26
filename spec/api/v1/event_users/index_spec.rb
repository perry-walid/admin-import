require 'rails_helper'

RSpec.describe "event_users#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/event_users", params: params
  end

  describe 'basic fetch' do
    let!(:event_user1) { create(:event_user) }
    let!(:event_user2) { create(:event_user) }

    it 'works' do
      expect(EventUserResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['event_users'])
      expect(d.map(&:id)).to match_array([event_user1.id, event_user2.id])
    end
  end
end
