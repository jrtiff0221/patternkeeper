class PatternsController < ApplicationController
  
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
end

def update
  @pattern = Pattern.find(params[:id])
  @pattern.update(pattern_params)
  redirect_to pattern_path(@pattern)
end

def edit
  if params[:user_id]
    user = User.find_by(id: params[:user_id])
    if user.nil?
      redirect_to users_path, alert: "User not found."
    else
      @pattern = user.patterns.find_by(id: params[:id])
      redirect_to user_patterns_path(user), alert: "Pattern not found." if @pattern.nil?
    end
  else
    @pattern = Pattern.find(params[:id])
  end
end
private

  def pattern_params 
    params.require(:pattern).permit(:title, :author, :category, :difficulty, :description, :name, :website, :user_id)
  end
end