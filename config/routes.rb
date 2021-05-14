Rails.application.routes.draw do
  devise_for :users

  root "articles#index"

  get 'search', to: "articles#search"
  get "u/:username" => "account#profile", as: :profile
  
  resources :articles do
    resources :comments
  end
end
