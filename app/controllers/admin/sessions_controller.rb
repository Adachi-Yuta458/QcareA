class Admin::SessionsController < Admin::ApplicationController
  layout 'admin'
  skip_before_action :admin_login_required

  def new; end

  def create
    lg = LocalGovernment.find_by(email: session_params[:email])

    if lg&.authenticate(session_params[:password])
        session[:local_government_id] = lg.id
        redirect_to admin_questions_path, notice: 'ログインしました'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to admin_login_path, notice: 'ログアウトしました'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
