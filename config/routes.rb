Rails.application.routes.draw do
  devise_for :users#, skip: [:sessions]
  resources :items
  root "top#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "sell/complete"  => "sell#complete"
  post "sell/create" => "sell#create"
  post "sell/confirm" => "sell#confirm"
  get "sell/new" => "sell#new"


end
