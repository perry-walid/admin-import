require 'rails_helper'

RSpec.describe FlightTicketResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'flight_tickets',
          attributes: { }
        }
      }
    end

    let(:instance) do
      FlightTicketResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { FlightTicket.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:flight_ticket) { create(:flight_ticket) }

    let(:payload) do
      {
        data: {
          id: flight_ticket.id.to_s,
          type: 'flight_tickets',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      FlightTicketResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { flight_ticket.reload.updated_at }
      # .and change { flight_ticket.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:flight_ticket) { create(:flight_ticket) }

    let(:instance) do
      FlightTicketResource.find(id: flight_ticket.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { FlightTicket.count }.by(-1)
    end
  end
end
