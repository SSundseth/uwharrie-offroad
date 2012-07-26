class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      UserMailer.password_reset(@user).deliver
      flash[:notice] = "Email has been sent with instructions"
      redirect_to root_url
    else
      flash[:error] = "Email not found"
      render :new
    end
  end
end
