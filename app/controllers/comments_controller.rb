class CommentsController < ApplicationController

  def new
    @comment = Comment.new(comment_params)
  end
  
  def create
    @comment = Comment.create(comment_params)
    if @comment.valid?
        @comment.save
        redirect_to pattern_comments_path(@comment)
    else
      render :new
    end
  end
    
  def index
    @comments = Comment.all.order("created_at ASC") 
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end

def edit
  set_comment
end

def update
  set_comment
  if current_user.id == @comment.user_id && @comment.update(comment_params)
    redirect_to  pattern_comments_path(@comment)
  else 
    render :edit 
  end
end

def destroy
  set_comment 
  if  current_user.id == @comment.user_id
    @comment.destroy 
    redirect to pattern_comment_path
  end
end

  private



  def set_pattern 
    @comment = Comment.find_by(id: params[:id])
    if !@comment
      redirect_to pattern_comment_path
    end
  end 

  
  def comment_params
    params.require(:comment).permit(:title, :name, :message, :pattern_id, :user_id)
  end
end