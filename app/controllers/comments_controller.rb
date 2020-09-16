class CommentsController < ApplicationController


  def index
    if params[:user_id]
      @comments = User.find(params[:user_id]).comments
    else
      @comments = Comment.all
    end
  end
 
  def show
    @comment = Comment.find(params[:id])
  end
    
  def new
    @comment = Comment.new(comment_params)
  
    redirect_to comment_path(@comment)
  end
  
  def create
   @comment = Coment.create(comment_params)
    if @comment.valid?
        @comment.save
    
        redirect_to comment_path(@comment)
    else
        render :new
    end
end 
  
  def destroy
    if  current_user.id == @comment.user_id
      @comment.destroy 
      redirect to comment_path
    end
  end

private


  def comment_params
    params.require(:comment).permit(:title, :name, :message, :user_id)
  end
end