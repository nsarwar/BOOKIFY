Rails.application.routes.draw do
  get 'users/index'
  resources :books do
    resources :reviews
  end
  resources :categories
  devise_for :users, :controllers => {
    :sessions => "users/sessions",
    :confirmations => "users/confirmations",
    :passwords => "users/passwords",
    :registrations => "users/registrations",
    :unlocks => "users/unlocks",

  }
  devise_scope :user do
    root :to => 'users/sessions#new'
    get "sign_in", to: "users/sessions#new"
    get "sign_up", to: "users/registrations#new"
    get "sign_out", to: "users/sessions#destroy"
  end
  resources :users, :only =>[:show]
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'
  # get 'books', to: "books#index"
end
