Rails.application.routes.draw do
  devise_for :users,
    controllers:{omniauth_callbacks: "users/omniauth_callbacks"}

  as :user do
    get "signup", to: "devise/registrations#new"
    get "signin", to: "devise/sessions#new"

    post "signup", to: "devise/registrations#create"
    post "signin", to: "devise/sessions#create"

    delete "signout", to: "devise/sessions#destroy"
  end

  namespace :admin do
    get "index"
  end
  root to: "home#index"
end
