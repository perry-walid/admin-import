class FlightTicketsController < ApplicationController
  def index
    flight_tickets = FlightTicketResource.all(params)
    respond_with(flight_tickets)
  end

  def show
    flight_ticket = FlightTicketResource.find(params)
    respond_with(flight_ticket)
  end

  def create
    flight_ticket = FlightTicketResource.build(params)

    if flight_ticket.save
      render jsonapi: flight_ticket, status: 201
    else
      render jsonapi_errors: flight_ticket
    end
  end

  def update
    flight_ticket = FlightTicketResource.find(params)

    if flight_ticket.update_attributes
      render jsonapi: flight_ticket
    else
      render jsonapi_errors: flight_ticket
    end
  end

  def destroy
    flight_ticket = FlightTicketResource.find(params)

    if flight_ticket.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: flight_ticket
    end
  end
end
