class PatternsController < ApplicationController
  
  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to users_path, alert: "User not found."
    else
      @pattern = Pattern.new(user_id: params[:user_id])
    end
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
  if params[:user_id]
    @patterns =  User.find(params[:user_id]).patterns
  else
    @patterns = Pattern.all.order("created_at ASC")
  end
end

def show
  if params[:user_id]
    @pattern = User.find(params[:user_id]).patterns.find(params[:id])
  else
    @pattern= Pattern.find(params[:id])
  end
    @comment = @pattern.comments.build
end

def update
  @pattern = Pattern.find_by(id: params[:id])
    redirect_to  pattern_path(@pattern)
end

def edit
  @pattern = Pattern.find_by(id: params[:id])
end

def destroy
  @pattern = Pattern.find_by(id: params[:id])
  @pattern.destroy
  redirect_to root_path
end
private 

  def pattern_params 
    params.require(:pattern).permit(:title, :author, :category, :difficulty, :description, :name, :website, :user_id)
  end
end