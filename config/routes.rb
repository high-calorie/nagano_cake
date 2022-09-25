Rails.application.routes.draw do
  namespace :admin do

    resources :genres, only: [:create, :new, :index, :edit, :update, :destroy]
    resources :items, except: [:destroy]
    get 'homes/top'
  end

  namespace :public do
    resources :items, only: [:show, :index]
    get 'homes/top'
    get 'homes/about'
    get 'unsubscribe/:name' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch '/withdraw/:name' => 'customers#withdraw', as: 'withdraw_customer'
    put 'withdraw/:name' => 'customers#withdraw'
  
  resources :genres, only: [:index, :create, :new, :edit, :update, :destroy]
  get 'homes/top'
    get 'customers/show'
    get 'customers/edit'
  end

    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]

    get "search" => "searches#search"

 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

end



