Rails.application.routes.draw do

  namespace :admin do
<<<<<<< HEAD
    resources :genres, only: [:create, :new, :edit, :update, :destroy]

    resources :items, only: [:index]
=======
    get 'genres/index'
    get 'genres/edit'

    resources :genres, only: [:create, :index]
    resources :items, except: [:destroy]
>>>>>>> cd3a2554e8acd31ed6d334b189c2b30ad9ad9a8b

    get 'customers/show'
  end


 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 

end

