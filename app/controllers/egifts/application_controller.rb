class Egifts::ApplicationController < ApplicationController
  layout "egifts/application"

  private

  def current_brand
    Brand.first
  end
end
