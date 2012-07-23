class TimingsController < ApplicationController
  def new
    @timing = Timing.new
  end

  def create
    @trail = Trail.find(params[:timing][:trail_id])
    total = params[:hours].to_i*3600 + params[:minutes].to_i*60 + params[:seconds].to_i
    @timing = @trail.timings.build(:user_id => current_user.id, :seconds => total)

    if @timing.save
      flash[:notice] = "Your time has been saved"
      redirect_to current_user
    else
      flash[:error] = "Time not saved"
      render :new
    end
  end
end
