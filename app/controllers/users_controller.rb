class UsersController < ApplicationController
  
  def show
        @user = User.find(params[:id])
    end
    
    def index
      if params[:user_id]
        @patterns =  User.find(params[:user_id]).patterns
      else
        @patterns = Pattern.all.order("created_at ASC")
      end
    end

    def patterns_index
        @user = User.find(params[:id])
        @patterns = @user.patterns
        render template: 'patterns/index'
      end
      
      def pattern
        @user = User.find(params[:id])
        @pattern = Pattern.find(params[:pattern_id])
        render template: 'patterns/show'
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

      def comments_index
        @user = User.find(params[:id])
        @comments = @user.comments
        render template: 'comments/index'
      end

   
    def comment
      @user = User.find(params[:id])
      @comment = Comment.find(params[:comment_id])
      render template: 'comments/show'
    end

    def user_pattern_comments_index
      @user = User.find(params[:id])
      @pattern
      @comment = Comment.find(params[:comment_id])
      @commens = @pattern.comments

end