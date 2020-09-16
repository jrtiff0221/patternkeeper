class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
    end
    
    def index
        @Users = User.all
    end

    def patterns_index
        @user = User.find(params[:id])
        @patterns = @user.patterns
        render template: 'poss/index'
      end
     
      def pattern
        @author = Author.find(params[:id])
        @pattern = pattern.find(params[:pattern_id])
        render template: 'patterns/show'
      end
end