class Comment < ActiveRecord::Base
    
    validates :name, :title, :message, presence: true
    
    belongs_to :user
    belongs_to :post
    accepts_nested_attributes_for :user
  
    def user_attributes=(user_attributes)
      self.user = User.find_or_create_by(name: user_attributes[:name]) if user_attributes[:name].present?
    end
  
  end
  