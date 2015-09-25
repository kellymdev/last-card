Rails.application.routes.draw do
  resources :games, only: [:show, :new, :create]
end
