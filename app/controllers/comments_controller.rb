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
  if current_user.id == @comment.user_id && @comment.update(comment_params)
    redirect_to  pattern_path(@pattern)
  else 
    render :edit 
  end
end


def edit
  @comment = Comment.find_by(id: params[:id])
end
  
def destroy
  @comment = Comment.find_by(id: params[:id])
  @comment.delete
  redirect_to root_path
end
private

  def comment_params
    params.require(:comment).permit(:title, :name, :message, :user_id, :pattern_id)
  end
end