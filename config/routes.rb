Rails.application.routes.draw do
  devise_for :users#, skip: [:sessions]
  resources :items
  resources :carts, only: [:show]

  root "top#index"


  #get "items/:id" => "items#show"
  post 'carts/add' => 'carts#add'
  get 'carts/show'  => 'carts#show'
  get "items/:id" => "carts#new"

  post 'carts/update' => 'carts#update'
  delete 'carts/delete' => 'carts#delete'
  post "carts/create" => "carts#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "users/nologin" => "users#nologin"
  get "users/mypage/sell_history" => "users#sell_history"

  get "items/complete"  => "items#complete"
  post "items/create" => "items#create"
  post "items/confirm" => "items#confirm"
  get "items/new" => "items#new"


end
