class ApplicationController < ActionController::Base
  protect_from_forgery
  include SimplestAuth::Controller

  def store_return_to
    session[:return_to] = request.url
  end

  protected

  def local_request?
    false
  end

  def rescue_action_in_public(exception)
    render :file => "#{RAILS_ROOT}/public/404.html"
  end
end
