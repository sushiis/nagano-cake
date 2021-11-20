Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers

scope module: :customer do
  #public_customers
  get "/customers/my_page" => "customer/customers#show"
  get "/customers/edit" => "customer/customers#edit"
  patch "/customers" => "customer/customers#update"
  get "/customers/unsubscribe" => "customer/customers#unsubscribe"
  patch "/customers/withdraw" => "customer/customers#withdraw"

  #public_homes
  root to: "customer/homes#top"
  get "/about" => "customer/hoems#about"

  #public_items
  resources :items, only: [:index, :show]
  #public_cart_items
  resources :cart_items, only: [:index, :update, :create, :destroy]
  delete "/cart_items/destroy_all" => "customer/cart_items#all_destroy"
  #public_orders
  resources :orders, only: [:index, :show, :new, :create]
  post "/orders/confirm" => "customer/orders#confirm"
  get "/thanx" => "customer/orders#thanx"
  #public_addresses
  resources :addresses, only: [:index, :create, :destroy, :edit, :update]
end

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
      resource :order_details, only: [:update]
    end
  end

end
