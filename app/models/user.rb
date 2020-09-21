class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,  omniauth_providers: %i[github]
         
  validates :email, uniqueness: true
 
  has_many :patterns
  has_many :comments, through: :patterns

  def self.from_omniauth(auth)
    where(provider: auth.provider, user_id: auth.user_id).first_or_create do |user|
      user.provider = auth.provider
      user.name = auth.info.name 
      user.user_id = auth.user_id 
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
  
end