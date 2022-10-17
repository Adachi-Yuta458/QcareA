class SessionsController < ApplicationController
  def new; end

  def create
    staff = Staff.find_by(email: session_params[:email])

    if staff&.authenticate(session_params[:password])
      session[:staff_id] = staff.id
      redirect_to root_url, notice: 'ログインしました。'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'ログアウトしました。'
  end
  
  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
