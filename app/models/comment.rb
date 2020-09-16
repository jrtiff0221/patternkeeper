class Comment < ActiveRecord::Base
    validates :name, :title, :message, :user_id,  presence: true
  
    belongs_to :user
    belongs_to :pattern



    scope :ordered, -> {order('created_at ASC')}
    
  
  end
  