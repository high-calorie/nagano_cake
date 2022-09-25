Rails.application.routes.draw do
  namespace :admin do

    resources :genres, only: [:create, :new, :index, :edit, :update, :destroy]
    resources :items, except: [:destroy]
    get 'homes/top'
  end

  scope module: :public do
    resources :items, only: [:show, :index]
    get 'homes/top'
    get 'homes/about'
    resources :order do
        collection do
        get 'confirm' => 'orders#confirm'
        end
    end
    get '/my_page' => 'customers#show'
  
  
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
