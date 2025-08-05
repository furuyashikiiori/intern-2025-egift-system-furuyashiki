class TicketsController < ApplicationController
  layout "tickets/application"

  def show
    @ticket = Ticket.find_by(uuid: params[:uuid])
  end
end
