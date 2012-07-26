class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:name], params[:password])

    if user
      self.current_user = user
      flash[:notice] = "Login successful"
      redirect_to session[:return_to]
    else
      flash[:error] = 'Invalid username or password'
      render :new
    end
  end

  def destroy
    self.current_user = nil
    flash[:notice] = "You have logged out"
    redirect_to session[:return_to]
  end
end
