CcProject::Application.routes.draw do
  get "static_pages/search_user"

  get "static_pages/about"

  resources :distance_essentials

  resources :teams


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

end
