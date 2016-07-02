Rails.application.routes.draw do
  root to: 'games#new'

  get '/games/:id/deal', to: 'games#deal', as: :deal_game

  resources :games, only: [:show, :new, :create] do
    resources :players, only: [:new, :create] do
      resources :turns, only: :create
    end
  end
end
