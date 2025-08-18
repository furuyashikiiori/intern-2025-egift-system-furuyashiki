class EgiftStores::ApplicationController < ApplicationController
  layout "egift_stores/application"

  helper_method :current_brand
  before_action :validate_current_brand

  private

  def current_brand
    @current_brand ||= Brand.find_by(domain: request.host)
  end

  def validate_current_brand
    head :not_found if current_brand.blank?
  end
end
