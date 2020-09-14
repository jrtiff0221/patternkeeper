class CommentsController < ApplicationController
  before_action :set_pattern, only: [:show, :edit, :update, :destory]
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to comment_path(@comment)
  end

  def index
    if params[:pattern_id]
      @comments = Pattern.find_by(:id params[:pattern_id]).comments
    else
      @comments = Comment.all
    end
  end
 
  def show
    @comment = Comment.find_by(:id params[:id])
  end

  def update
    @comment = Comment.find_by(:id params[:id])
    @comment.update(comment_params)
    redirect_to comment_path(@comment)
  end

  def edit
    @comment = Comment.find_by(:id params[:id])
  end
  
  def destroy
    @comment = Comment.find_by(:id params[:id])
    @comment.destroy
    redirect_to(@comment.post)
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
    if !@comment
      redirect_to comments_path 
    end
  end 

  def comment_params
    params.require(:comment).permit(:title, :name, :message, :pattern_id, :user_id)
  end
end