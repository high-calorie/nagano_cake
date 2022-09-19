Rails.application.routes.draw do

  namespace :admin do
<<<<<<< HEAD
    resources :genres, only: [:create, :new, :edit, :update, :destroy]
    resources :items, except: [:destroy]
=======
    get 'homes/top'

    resources :genres, only: [:create, :index]
    resources :items, except: [:destroy]

>>>>>>> 91935f815902b689aa04c399208c68b4158712c3

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

