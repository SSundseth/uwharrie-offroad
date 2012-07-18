class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      self.current_user = @user
      redirect_to root_url, :notice => "You have successfully registered"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to current_user, :notice => "Account Updated"
    else
      flash.now[:error] = "Account not Updated"
      render :edit
    end
  end
end
