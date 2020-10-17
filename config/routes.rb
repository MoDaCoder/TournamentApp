Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'application#home'
  devise_for :users, :controllers => { omniauth_callbacks: "callbacks"}
  # login route instead of users/login
  # devise_scope :users do
  #   get 'login', to: 'devise/sessions#new'
  # end
  # devise_scope :users do
  #   get 'signup', to: 'devise/registrations#new'
  # end
  resources :players
  resources :matches do 
  resources :players
  end
end
