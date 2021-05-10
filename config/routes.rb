Rails.application.routes.draw do
  devise_for :users
  get "u/:username" => "account#profile", as: :profile
  root "articles#index"
  resources :articles do
    resources :comments
  end
end
