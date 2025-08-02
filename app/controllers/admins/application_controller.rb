class Admins::ApplicationController < ApplicationController
  layout "admins/application"

  def current_brand
    Brand.first
  end
end
