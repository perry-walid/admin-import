require 'rails_helper'

RSpec.describe "flight_tickets#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/flight_tickets/#{flight_ticket.id}", payload
  end

  describe 'basic update' do
    let!(:flight_ticket) { create(:flight_ticket) }

    let(:payload) do
      {
        data: {
          id: flight_ticket.id.to_s,
          type: 'flight_tickets',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(FlightTicketResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { flight_ticket.reload.attributes }
    end
  end
end
