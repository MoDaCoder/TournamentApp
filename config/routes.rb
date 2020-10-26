Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'application#home'
  devise_for :users, :controllers => { omniauth_callbacks: "callbacks"}

  post '/users/id:/players', to: 'players#create'
  
  # resources :matches
  resources :players

  resources :users do 
    resources :players
      resources :matches
    end
  end

