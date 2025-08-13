class EgiftStores::ApplicationController < ApplicationController
  layout "egift_stores/application"

  helper_method :current_brand

  private

  def current_brand
    Brand.first
  end
end
