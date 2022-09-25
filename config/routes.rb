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

    resources :deliveries, only: [:index, :edit, :create, :update, :destroy]
    get 'customers/show'
    get 'customers/edit'

    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :orders,only: [:new,:index,:show,:create] do
  end

    get "search" => "searches#search"

 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

end


end
