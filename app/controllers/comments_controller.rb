class CommentsController < ApplicationController

    def create
      #comment = Comment.create(comment_params)
      #comment.save()
      #redirect_to pattern_path(comment.pattern_id)
      @pattern = Pattern.find(params[:pattern])
      @comment = @pattern.comments.create(params[:comment])
      redirect_to patterns_path
     
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:title, :name, :message, :pattern_id, :user_id)
    end
  end