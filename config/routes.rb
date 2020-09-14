Rails.application.routes.draw do

  root 'application#home'
    
  devise_for :users, :controllers => {:registrations => "registrations", omniauth_callbacks: 'callbacks'}
  
    devise_scope :user do 
       get 'login', to: 'devise/sessions#new'
     
    end
    devise_scope :user do 
      get 'signup', to: 'devise/sessions#new'
   end
  
  resources :patterns

 
  get 'pattern/:id/comments', to: 'patterns#comments_index'
  
  get 'pattern/:id/comments/:comment_id', to: 'patterns#comments'
 
    
  resources :patterns, only: [:show] do 
    resources :comments, only: [:index, :show, :new, :create, :edit, :update]  
  end
  resources :comments, only: [:index, :show, :new, :create, :edit, :update] 

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
