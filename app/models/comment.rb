class Comment < ActiveRecord::Base
    
    validates :name, :title, :message, :pattern_id, :user_id, presence: true
    
    belongs_to :user
    belongs_to :pattern
    accepts_nested_attributes_for :user
  
  end
  