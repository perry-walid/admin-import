require 'rails_helper'

RSpec.describe "flight_tickets#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/flight_tickets", payload
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
          type: 'flight_tickets',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(FlightTicketResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { FlightTicket.count }.by(1)
    end
  end
end
