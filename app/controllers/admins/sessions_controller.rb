class Admins::SessionsController < Admins::ApplicationController
  include Admins::UserSession
  
  def new
  end

  def create
    admin_user = AdminUser.find_by(email: session_params[:email])

    if admin_user&.authenticate(session_params[:password])
      create_admin_user_session(admin_user)
      return redirect_to admins_root_path
    end

    flash.now[:alert] = "入力情報が正しくありません"
    render :new, status: :unprocessable_entity
  end

  def destroy
    delete_admin_user_session
    redirect_to action: :new
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
