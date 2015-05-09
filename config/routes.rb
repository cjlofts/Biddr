Rails.application.routes.draw do

  root "welcome#index"

  resources :auctions do
    resources :bids
    resources :meet_reserves
  end
end
