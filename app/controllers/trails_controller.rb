class TrailsController < ApplicationController

  before_filter :store_return_to

  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
    @comments = @trail.comments
    @commentable = @trail
  end
end
