Rails.application.routes.draw do

  devise_for :users
  root "welcome#index"

  resources :auctions do
    resources :bids
    resources :meet_reserves
  end

  resources :bids, only: [:index]
end
