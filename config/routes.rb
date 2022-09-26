Rails.application.routes.draw do


 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do

    resources :genres, only: [:create, :new, :index, :edit, :update, :destroy]
    resources :items, except: [:destroy]
    resources :orders, only: [:show, :update]
    get 'homes/top'
    resources :order_details, only: [:update]
    resources :customers

  end

  scope module: :public do

    resources :items, only: [:show, :index]
    get 'homes/top'
    get 'homes/about'

    get "/unsubscribe" => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch '/withdraw/:name' => 'customers#withdraw', as: 'withdraw_customer'
    put 'withdraw/:name' => 'customers#withdraw'

    post 'orders/confirm' => 'orders#confirm', as: 'order_confirm'



    resources :orders


    get '/my_page' => 'customers#show'


    resources :genres, only: [:index, :create, :new, :edit, :update, :destroy]
    get 'homes/top'


    resources :deliveries, only: [:index, :edit, :create, :update, :destroy]

    resources :customers, only: [:show, :edit, :update]

    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]

    get "search" => "searches#search"

  end

end

