require 'rails_helper'

RSpec.describe "event_users#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/event_users/#{event_user.id}", params: params
  end

  describe 'basic fetch' do
    let!(:event_user) { create(:event_user) }

    it 'works' do
      expect(EventUserResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('event_users')
      expect(d.id).to eq(event_user.id)
    end
  end
end
