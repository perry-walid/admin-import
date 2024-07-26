require 'rails_helper'

RSpec.describe "event_users#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/event_users", payload
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
          type: 'event_users',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(EventUserResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { EventUser.count }.by(1)
    end
  end
end
