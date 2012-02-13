JSMerchant::Application.routes.draw do
  resources :addresses

  resources :orders

  resources :order_items

  resources :products
  root :to => 'products#index'

  match '/auth/:provider/callback', :to => 'sessions#create'

  match '/login' => redirect("/auth/twitter"), :as => :login
  match '/logout' => "sessions#destroy", :as => :logout
end
