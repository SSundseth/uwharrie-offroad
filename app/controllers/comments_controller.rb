class CommentsController < ApplicationController
  def create
    @commentable = find_object
    @comment = @commentable.comments.build(params[:comment].merge(:user_id => current_user.id))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.get_trail }
      else
        flash[:error] = "Comment cannot be blank"
        format.html { redirect_to @comment.get_trail }
      end
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @comments = @comment.comments
    @commentable = @comment
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.update_attributes(:deleted => true, :body => "Comment has been deleted by user")
    redirect_to @comment.get_trail
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if !params[:body].blank?
      @comment.update_attributes(:body => "#{@comment.body}\nEDIT: #{params[:body]}")
      redirect_to @comment.get_trail
    else
      flash[:error] = "Edit cannot be blank"
      render :edit
    end
  end


  private

  def find_object
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
