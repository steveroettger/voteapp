class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_p3p
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  # for IE session cookies thru iframe  
  def set_p3p  
      headers['P3P'] = 'CP="ALL DSP COR CURa ADMa DEVa OUR IND COM NAV"'  
  end
end
