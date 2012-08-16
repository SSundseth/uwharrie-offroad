class TrailsController < ApplicationController

  before_filter :store_return_to

  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
    @comments = @trail.comments.paginate(:page => params[:page], :per_page => 5)
    @commentable = @trail
  end
end
