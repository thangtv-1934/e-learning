Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users,
    controllers:{omniauth_callbacks: "users/omniauth_callbacks"}

  as :user do
    get "signup", to: "devise/registrations#new"
    get "signin", to: "devise/sessions#new"

    post "signup", to: "devise/registrations#create"
    post "signin", to: "devise/sessions#create"

    delete "signout", to: "devise/sessions#destroy"
  end

  resources :users, only: %i(show)

  namespace :admin do
    get "index"
    resources :courses, except: :show
    resources :users
  end

  get "follow/:follow_user_id", to: "users#follow", as: "follow_path"
  get "unfollow/:unfollow_user_id", to: "users#unfollow", as: "unfollow_path"
  get "course/:course_id/words", to: "words#index", as: "learn_words"
end
