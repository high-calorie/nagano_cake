

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
  end



  resources :genres, only: [:index, :create, :new, :edit, :update, :destroy]
  get 'homes/top'

  resources :items, except: [:destroy]

    get 'customers/show'
    get 'customers/edit'
    # patch 'customer/:id'
    get "search" => "searches#search"

 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

end

