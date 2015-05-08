Rails.application.routes.draw do

  root "welcome#index"

  resources :auctions do
    resources :bids
  end
end
