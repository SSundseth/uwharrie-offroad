class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_path, :notice => "You have successfully registered"
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
