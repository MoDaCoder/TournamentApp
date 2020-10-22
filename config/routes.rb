Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'application#home'
  devise_for :users, :controllers => { omniauth_callbacks: "callbacks"}

  post '/users/id:/players', to: 'players#create'
  #Custom controller to create players
  
  # get '/users/id:/players/id:', to: 'players#show'
  # #Custom controller to show players

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
# create a custom route that goes create players controller
# match show collection user.players not player .all
# get list of ids
# get players.new
# reroute to matches show page
#******* Ask Hanaa what the GOAL here was. I think I MISSED exactly what I supposed to ACHIEVE.*******

