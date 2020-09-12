class CommentsController < ApplicationController

    def create
      comment = Comment.create(comment_params)
      redirect_to comment.pattern_id
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:message, :pattern_id, :user_id, user_attributes:[:name])
    end
  end