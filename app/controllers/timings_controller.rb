class TimingsController < ApplicationController
  def new
    @timing = Timing.new
  end

  def create
    @timing = Timing.new(params[:timing])
    if @timing.save
      flash[:notice] = "Your time has been saved"
      redirect_to root_url
    else
      flash[:error] = "Time not saved"
      render :new
    end
  end
end
