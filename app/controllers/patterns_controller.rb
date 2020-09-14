class PatternsController < ApplicationController
  before_action :set_pattern, only: [:show, :edit, :update, :destory]

def new
  @pattern = Pattern.new
end

def create
  @pattern = Pattern.create(pattern_params)
  if @pattern.valid?
    @pattern.save
    
    redirect_to pattern_path(@pattern)
  else
    render :new 
  end
end

def index
  @patterns = Pattern.all.order("created_at ASC")
  
end

def comments_index
  @pattern = Pattern.find_by(id: params[:id])
  @comments = @pattern.comments
  render template: 'comments/index'
end

def comment
  @author = Author.find(params[:id])

  # Note that because ids are unique by table we can go directly to
  # Comment.find — no need for @pattern.comments.find...
  @comment = Comment.find_by(id: params[:comment_id])
  render template: 'comments/show'
end

def show 
  @pattern = Pattern.find_by(id: params[:id])
  @comment = Comment.find_by(id: params[:id])
  render template 'patterns/show'
end 

def edit
  set_pattern
end

def update
  set_pattern
  if current_user.id == @pattern.user_id && @pattern.update(pattern_params)
    redirect_to  pattern_path(@pattern)
  else 
    render :edit 
  end
end

def destroy
  set_pattern 
  if  current_user.id == @pattern.user_id
    @pattern.destroy 
    redirect to patterns_path
  end
end
private

  def set_pattern 
    @pattern = Pattern.find_by(id: params[:id])
    if !@pattern 
      redirect_to patterns_path 
    end
  end 

  def pattern_params 

    params.require(:pattern).permit(:title, :author, :category, :difficulty, :description, :name, :website, :user_id)
  end
end