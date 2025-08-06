class Egifts::TicketsController < Egifts::ApplicationController
  def show
    @ticket = current_brand.tickets.find_by(uuid: params[:uuid])
  end
end
