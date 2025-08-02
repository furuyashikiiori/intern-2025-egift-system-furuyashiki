class Egifts::ApplicationController < ApplicationController
  layout "egifts/application"

  def current_brand
    Brand.first
  end
end
