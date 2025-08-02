class EgiftStores::ApplicationController < ApplicationController
  layout "egift_stores/application"

  def current_brand
    Brand.first
  end
end
