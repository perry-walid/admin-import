require 'rails_helper'

RSpec.describe "event_users#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/event_users/#{event_user.id}", payload
  end

  describe 'basic update' do
    let!(:event_user) { create(:event_user) }

    let(:payload) do
      {
        data: {
          id: event_user.id.to_s,
          type: 'event_users',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(EventUserResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { event_user.reload.attributes }
    end
  end
end
