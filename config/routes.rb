Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create,:update, :show]
      resources :interests, only: [:index]
      resources :matches, only: [:index, :create]
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
    end
  end
end
