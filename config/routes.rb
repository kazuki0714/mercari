Rails.application.routes.draw do
  devise_for :users#, skip: [:sessions]
 resources :items
 resources :carts, only: [:show]

  root "top#index"　
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #get "/" =>"top#index"


  get "items/search" => "items#seach"
  get "items/noresult" => "items#noresult"
  get "items/:id/quantity" => "items#quantity"
  get "items/:id" => "items#show"

  post 'carts/update' => 'carts#update'
  delete 'carts/delete' => 'carts#delete'
  post "carts/create" => "carts#create"
  get 'carts/complete'  => 'carts#complete'
  post 'carts/create' => 'carts#create'
  get 'carts/show'  => 'carts#show'
  post 'carts/new' => 'carts#new'



  get "users/nologin" => "users#nologin"
  get "users/mypage/sell_history" => "users#sell_history"
  get "users/mypage" => "users#mypage"

  get "items/complete"  => "items#complete"
  post "items/create" => "items#create"
  post "items/confirm" => "items#confirm"
  get "items/new" => "items#new"


end
