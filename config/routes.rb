JSMerchant::Application.routes.draw do
  resources :orders

  resources :order_items

  resources :products
  root :to => 'products#index'

  match '/auth/:provider/callback', :to => 'sessions#create'
end
