require 'rails_helper'

RSpec.describe FlightTicketResource, type: :resource do
  describe 'serialization' do
    let!(:flight_ticket) { create(:flight_ticket) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(flight_ticket.id)
      expect(data.jsonapi_type).to eq('flight_tickets')
    end
  end

  describe 'filtering' do
    let!(:flight_ticket1) { create(:flight_ticket) }
    let!(:flight_ticket2) { create(:flight_ticket) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: flight_ticket2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([flight_ticket2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:flight_ticket1) { create(:flight_ticket) }
      let!(:flight_ticket2) { create(:flight_ticket) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            flight_ticket1.id,
            flight_ticket2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            flight_ticket2.id,
            flight_ticket1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
