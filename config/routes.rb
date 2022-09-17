Rails.application.routes.draw do
  namespace :admin do
    resources :items, only: [:index]
  end

 devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
end