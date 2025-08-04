module Admins::Concerns::UserSession
  extend ActiveSupport::Concern

  SESSION_KEY_ADMIN_USER_ID = 'admin_user_id'

  included do
    helper_method :current_admin_user
  end

  private

  def create_admin_user_session(admin_user)
    session[SESSION_KEY_ADMIN_USER_ID] = admin_user.id
  end

  def delete_admin_user_session
    session[SESSION_KEY_ADMIN_USER_ID] = nil
  end

  def current_admin_user
    return nil if session[SESSION_KEY_ADMIN_USER_ID].blank?
    @current_admin_user ||= AdminUser.find_by(id: session[SESSION_KEY_ADMIN_USER_ID])
  end
end
