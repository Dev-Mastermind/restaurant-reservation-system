Rails.application.routes.draw do
  root "home#welcome"
  resources :reservations, only: [:index, :create]
end
