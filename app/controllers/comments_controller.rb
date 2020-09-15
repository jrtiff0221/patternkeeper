class CommentsController < ApplicationController

def new 
  @comment = Comment.new(comment_params)
end

def create
  @comment = Comment.create(comment_params)
  @commen.save
  redirect_to comment_path(@comments)
end
  
  def index
    if params[:pattern_id]
      @comments = Pattern.find(params[:pattern_id]).comments
    else
      @comments = Comment.all
    end
  end
 
  def show
    @comments = @pattern.comments
  end

private
  def comment_params
    params.require(:comment).permit(:title, :name, :message, :user_id, :pattern_id)
  end
end