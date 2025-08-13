class Egifts::ApplicationController < ApplicationController
  layout "egifts/application"

  helper_method :current_brand

  private

  def current_brand
    Brand.first
  end
end
