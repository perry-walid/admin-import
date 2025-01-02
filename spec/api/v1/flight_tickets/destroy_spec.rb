require 'rails_helper'

RSpec.describe "flight_tickets#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/flight_tickets/#{flight_ticket.id}"
  end

  describe 'basic destroy' do
    let!(:flight_ticket) { create(:flight_ticket) }

    it 'updates the resource' do
      expect(FlightTicketResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { FlightTicket.count }.by(-1)
      expect { flight_ticket.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
