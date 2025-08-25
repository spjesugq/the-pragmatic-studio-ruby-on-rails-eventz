Rails.application.routes.draw do
  resources :categories
  root "events#index"
  
  resources :users
  get "signup" => "users#new"
  
  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"
  
  resources :events do
    resources :registrations
    resources :likes
  end
  get "events/filter/:filter" => "events#index", as: :filtered_events
end
