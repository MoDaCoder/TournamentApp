Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'application#home'

  devise_for :users, :controllers => { omniauth_callbacks: "callbacks"}

  resources :users do
    resources :matches do
    resources :players
  end
end

  # resource :user do
  #   resource :match do
  #     resources :players
  #     end
  #   end
  # end

  resources :users do 
    resources :players
  end
end