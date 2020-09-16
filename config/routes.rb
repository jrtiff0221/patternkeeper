Rails.application.routes.draw do

  root 'application#home'

  get 'users/:id/patterns', to: 'users#patterns_index'
  get 'users/:id/patters/:pattern_id' , to: 'users#pattern'
 
  devise_for :users, :controllers => {:registrations => "registrations", omniauth_callbacks: 'callbacks'}
  
    devise_scope :user do 
       get 'login', to: 'devise/sessions#new'
      get 'signup', to: 'devise/sessions#new'
    end
   
  resources :users, only: [:index, :show]
  
  resources :patterns, only: [:index, :show, :new, :create, :edit, :update] 
  
  resources :comments, only: [:index, :show, :new, :create, :edit, :update] 

  
  resources :users, only: [:show] do
    resources :patterns, only: [:index, :show, :new] do
      resources :comments, only: [:index, :show, :new]
    end
  end


# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
