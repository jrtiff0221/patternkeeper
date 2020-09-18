class CommentsController < ApplicationController
  
  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to users_path, alert: "User not found."
    else
      @comment = Comment.new(user_id: params[:user_id])
    end
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.valid?
      @comment.save
  
      redirect_to comment_path(@comment)
    else
      render :new 
    end
  end

def index
  if params[:user_id]
    @comments =  User.find(params[:user_id]).comments
  else
    @comments = Comment.all.order("created_at ASC")
  end
end

def show
  if params[:user_id]
    @comment = User.find(params[:user_id]).comments.find(params[:id])
  else
    @comment= Comment.find(params[:id])
  end
end

def update
  @comment = Comment.find(params[:id])
  @comment.update(comment_params)
  redirect_to comment_path(@comment)
end

def edit
  if params[:user_id]
    user = User.find_by(id: params[:user_id])
    if user.nil?
      redirect_to users_path, alert: "User not found."
    else
      @comment = user.comments.find_by(id: params[:id])
      redirect_to user_comments_path(user), alert: "Comment not found." if @comment.nil?
    end
  else
    @comment = Comment.find(params[:id])
  end
end
private
  def comment_params
    params.require(:comment).permit(:title, :name, :message, :user_id, :pattern_id)
  end
end