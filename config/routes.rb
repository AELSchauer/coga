Rails.application.routes.draw do
  get "/status", to: "status#index"
  namespace :api do
    namespace :v1 do
      post "/login", to: "sessions#create"
      post "/refresh", to: "user/tokens#create"
      post "/confirm", to: "user/confirmations#create"

      resources :users, only: [:index, :create]
    end
  end
end
