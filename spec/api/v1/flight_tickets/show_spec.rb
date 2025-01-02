require 'rails_helper'

RSpec.describe "flight_tickets#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/flight_tickets/#{flight_ticket.id}", params: params
  end

  describe 'basic fetch' do
    let!(:flight_ticket) { create(:flight_ticket) }

    it 'works' do
      expect(FlightTicketResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('flight_tickets')
      expect(d.id).to eq(flight_ticket.id)
    end
  end
end
