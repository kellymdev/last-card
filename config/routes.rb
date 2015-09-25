Rails.application.routes.draw do
  resources :games, only: [:show, :new, :create] do
    resources :players, only: [:new, :create]
  end
end
