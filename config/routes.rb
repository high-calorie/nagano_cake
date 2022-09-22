
Rails.application.routes.draw do

  get 'cart_items/index'
  namespace :admin do
  resources :genres, only: [:index, :create, :new, :edit, :update, :destroy]
  get 'homes/top'

    resources :items, except: [:destroy]

    get 'customers/show'
    get 'customers/edit'
   #patch 'customers/:id'
  end

  namespace :public do
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
  end


 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}



end



