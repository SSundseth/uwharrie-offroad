class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(params[:name], params[:password])

    if user
      self.current_user = user
      redirect_to users_path
    else
      flash[:error] = 'Invalid username or password'
      render :new
    end
  end

  def destroy
    self.current_user = nil
    redirect_to root_url
  end
end
