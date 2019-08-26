Rails.application.routes.draw do
  devise_for :users#, skip: [:sessions]
  resources :items
  root "top#index"
  get "items/:id" => "items#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "users/nologin" => "users#nologin"
  get "users/mypage/sell_history" => "users#sell_history"

  post "buy/create" => "buy#create"
  get "items/complete"  => "items#complete"
  post "items/create" => "items#create"
  post "items/confirm" => "items#confirm"
  get "items/new" => "items#new"


end
