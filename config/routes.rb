Rails.application.routes.draw do
  #devise_for :users
  root "top#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "sell/complete"  => "sell#complete"
  post "sell/create" => "sell#create"
  post "sell/confirm" => "sell#confirm"
  get "sell/new" => "sell#new"


   get "/" => "top#index" #のちほど画面９に変更
end
