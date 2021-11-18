Rails.application.routes.draw do
  devise_for :customers

  #public_customers
  get "/customers/my_page" => "public/customers#show"
  get "/customers/edit" => "public/customers#edit"
  patch "/customers" => "public/customers#update"
  get "/customers/unsubscribe" => "public/customers#unsubscribe"
  patch "/customers/withdraw" => "public/customers#withdraw"

  #public_homes
  root to: "public/homes#top"
  get "/about" => "public/hoems#about"

  #public_items
  resources :items, only: [:index, :show]
  #public_cart_items
  resources :cart_items, only: [:index, :update, :create, :destroy]
  delete "/cart_items/destroy_all" => "public/cart_items#all_destroy"
  #public_orders
  resources :orders, only: [:index, :show, :new, :create]
  post "/orders/confirm" => "public/orders#confirm"
  get "/thanx" => "public/orders#thanx"
  #public_addresses
  resources :addresses, only: [:index, :create, :destroy, :edit, :update]

  namespace :admin do
    #admin_customers
    resources :customers, only: [:index, :show, :edit, :update]
    #admin_items
    resources :items, only: [:index, :show, :new, :create, :edit, :update]
    #admin_genres
    resources :genres, only: [:index, :edit, :create, :update]
    #admin_orders
    resources :orders, only: [:index, :show, :update] do
      #admin_order_items
      resource :order_items, only: [:update]
    end
  end

end
