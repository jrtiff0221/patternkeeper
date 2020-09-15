Rails.application.routes.draw do

  root 'application#home'
    
  devise_for :users, :controllers => {:registrations => "registrations", omniauth_callbacks: 'callbacks'}
  
    devise_scope :user do 
       get 'login', to: 'devise/sessions#new'
     
    end
    devise_scope :user do 
      get 'signup', to: 'devise/sessions#new'
   end
  
  resources :patterns, only: [:index, :show, :new, :create, :edit, :update] 
  
  resources :comments, only: [:index, :show, :new, :create, :edit, :update]  

 
  get 'pattern/:id/comments', to: 'patterns#comments_index'
  
  get 'pattern/:id/comments/:comment_id', to: 'patterns#comments'
  

  resources :patterns, only: [:show, :index] do 
    resources :comments, only: [:index, :show]  

  end


# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
