Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/login", to: "sessions#create"
      post "/refresh", to: "user/tokens#create"
      post "/confirm", to: "user/confirmations#create"

      resource :users, only: [:create]
    end
  end
end
