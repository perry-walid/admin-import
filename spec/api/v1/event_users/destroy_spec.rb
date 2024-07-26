require 'rails_helper'

RSpec.describe "event_users#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/event_users/#{event_user.id}"
  end

  describe 'basic destroy' do
    let!(:event_user) { create(:event_user) }

    it 'updates the resource' do
      expect(EventUserResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { EventUser.count }.by(-1)
      expect { event_user.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
