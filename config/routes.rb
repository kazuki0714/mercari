Rails.application.routes.draw do
  #devise_for :users
  #root "top#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   get "sell/new" => "sell#new"
   post "sell/create" => "sell#create"

   get "/" => "top#index" #のちほど画面９に変更
end
