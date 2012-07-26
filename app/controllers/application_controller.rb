class ApplicationController < ActionController::Base
  protect_from_forgery
  include SimplestAuth::Controller

  def store_return_to
    session[:return_to] = request.url
  end
end
