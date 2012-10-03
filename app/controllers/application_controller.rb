class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Headers for Internet Explorer
      #   required so that IE accepts the cookies and prevents a redirect-loop
      #
  before_filter :ie_headers
    def ie_headers
      response.headers['P3P'] = "CP=\"CAO PSA OUR\""
    end
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end
