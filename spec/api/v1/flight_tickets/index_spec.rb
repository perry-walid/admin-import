require 'rails_helper'

RSpec.describe "flight_tickets#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/flight_tickets", params: params
  end

  describe 'basic fetch' do
    let!(:flight_ticket1) { create(:flight_ticket) }
    let!(:flight_ticket2) { create(:flight_ticket) }

    it 'works' do
      expect(FlightTicketResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['flight_tickets'])
      expect(d.map(&:id)).to match_array([flight_ticket1.id, flight_ticket2.id])
    end
  end
end
