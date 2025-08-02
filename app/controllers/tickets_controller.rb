class TicketsController < ApplicationController
  layout "tickets_application"

  def show
    @ticket = Ticket.find_by(uuid: params[:uuid])
  end
end
