class Admin::ApplicationController < ApplicationController
  helper_method :current_lg
  before_action :admin_login_required

  private

  def current_lg
    @current_lg ||= LocalGovernment.find_by(id: session[:local_government_id]) if session[:local_government_id]
  end

  def admin_login_required
    redirect_to admin_login_path unless current_lg
  end
end