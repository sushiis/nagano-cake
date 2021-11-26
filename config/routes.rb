Rails.application.routes.draw do
  #devise_for :admins
  #devise_for :customers

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

scope module: :customers do
  #public_homes
  root to: "homes#top"
  get "/about" => "homes#about"

  #public_customers
  get "/customers/my_page" => "customers#show"
  get "/customers/edit" => "customers#edit"
  patch "/customers" => "customers#update"
  get "/customers/unsubscribe" => "customers#unsubscribe"
  patch "/customers/withdraw" => "customers#withdraw"

  #public_items
  resources :items, only: [:index, :show]
  #public_cart_items
  delete "/cart_items/destroy_all" => "cart_items#destroy_all"
  resources :cart_items, only: [:index, :update, :create, :destroy]

  #public_orders
  resources :orders, only: [:index, :show, :new, :create]
  post "/orders/confirm" => "orders#confirm"
  get "/thanx" => "orders#thanx"
  #public_addresses
  resources :addresses, only: [:index, :create, :destroy, :edit, :update]
end

  namespace :admins do
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
