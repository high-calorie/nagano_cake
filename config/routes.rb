<<<<<<< HEAD
Rails.application.routes.draw do
  namespace :admin do
=======


Rails.application.routes.draw do

  namespace :admin do

>>>>>>> 9d068e2549407e90fe43cd30deaa033ce1974e28
  resources :genres, only: [:index, :create, :new, :edit, :update, :destroy]
  get 'homes/top'

  resources :items, except: [:destroy]

    get 'customers/show'
    get 'customers/edit'
  end

  namespace :public do
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]

    get "search" => "searches#search"
    
    get 'homes/top'
    get 'homes/about'
  end
 
 

 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}



end



