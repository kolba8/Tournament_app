Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :tournaments do
    member do
      post "start"
    end
    resources :matches
  end
  
  resources :teams

  # post "/tournaments/:id/start", to: "tournaments#start", as: "start_tournament"
end
