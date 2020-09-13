class CommentsController < ApplicationController

    def create
      comment = Comment.create(comment_params)
      comment.save()
      
      pattern_path(comment.pattern_id)
  
     
      redirect_to pattern_path(comment.pattern_id)
     
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:title, :name, :message, :pattern_id, :user_id)
    end
  end