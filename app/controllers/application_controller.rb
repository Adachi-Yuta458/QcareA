class ApplicationController < ActionController::Base
  helper_method :current_staff

  private

  def current_staff
    @current_staff ||= Staff.find_by(id: session[:staff_id]) if session[:staff_id]
  end
end
