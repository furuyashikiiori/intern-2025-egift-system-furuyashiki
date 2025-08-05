class TicketsController < ApplicationController
  include Admins::Concerns::UserSession
  layout "tickets/application"

  def show
    @ticket = current_brand.tickets.find_by(uuid: params[:uuid])
  end

  private

  def current_brand
    Brand.first
  end
end
