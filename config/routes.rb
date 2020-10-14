Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  devise_for :users, :controllers => { omniauth_callbacks: "callbacks"}
  root to: 'application#home'
  # resources :players
  resources :matches do 
  resources :players
  end
end
