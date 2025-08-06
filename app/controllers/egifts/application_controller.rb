class Egifts::ApplicationController < ApplicationController
  layout "tickets/application"

  private

  def current_brand
    Brand.first
  end
end
