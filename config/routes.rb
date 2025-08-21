Rails.application.routes.draw do
  root "events#index"
  
  resources :users
  get "signup" => "users#new"

  resources :events do
    resources :registrations
  end
end
