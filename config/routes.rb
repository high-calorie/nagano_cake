Rails.application.routes.draw do
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'

    resources :items, only: [:index]

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
