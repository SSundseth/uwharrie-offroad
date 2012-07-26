class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @commentable = Trail.find(params[:trail_id])
    @comment = @commentable.comments.build(params[:comment].merge(:user_id => current_user.id))

    if @comment.save
      flash[:notice] = "Comment Saved"
      redirect_to @commentable
    else
      flash[:error] = "Comment not Saved"
      render :new
    end
  end

  def index
    @trail = Trail.find(params[:id])
    @comments = @trail.comments
  end

  def show
    @comment = Comment.find(params[:id])
    @comments = @comment.comments
    @commentable = @comment
  end
end
