Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/login", to: "sessions#create"
      post "/refresh", to: "tokens#create"

      resource :users, only: [:create]
    end
  end
end
