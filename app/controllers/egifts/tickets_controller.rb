class Egifts::TicketsController < Egifts::ApplicationController
  def show
    @ticket = current_brand.tickets.find_by(public_key: params[:public_key])
  end
end
