class Comment < ActiveRecord::Base
    validates :name, :title, :message, :user_id, presence: true
    
    belongs_to :users
    belongs_to :patterns
    
    

    scope :ordered, -> {order('created_at ASC')}
    
  
  end
  