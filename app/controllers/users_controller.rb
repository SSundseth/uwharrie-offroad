class UsersController < ApplicationController

  before_filter :store_return_to, :except => [:new, :create]

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
    @user = User.find_by_name(params[:name])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account Updated"
      redirect_to @user
    else
      flash[:error] = "Account not Updated"
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    self.current_user = nil
    redirect_to root_url
  end
end
