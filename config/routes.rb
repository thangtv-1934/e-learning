Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    get "index"
  end
  root to: "home#index"
end
