class Admins::ApplicationLoggedInController < Admins::ApplicationController
  layout "admins/application_logged_in"

  def current_brand
    Brand.first
  end
end
