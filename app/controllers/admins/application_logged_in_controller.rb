class Admins::ApplicationLoggedInController < Admins::ApplicationController
  include Admins::UserSession

  before_action :ensure_logged_in
  helper_method :current_brand
  
  layout "admins/application_logged_in"

  private

  def ensure_logged_in
    return redirect_to new_admins_session_path if current_admin_user.blank?
  end

  def current_brand
    @current_brand ||= current_admin_user.brand
  end
end
