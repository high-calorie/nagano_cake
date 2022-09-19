Rails.application.routes.draw do

  namespace :admin do
    resources :genres, only: [:create, :new, :edit, :update, :destroy]
    resources :items, except: [:destroy]

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

