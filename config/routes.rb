Rails.application.routes.draw do
  root "events#index"
  
  resources :users
  get "signup" => "users#new"

  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"

  resources :events do
    resources :registrations
  end
end
