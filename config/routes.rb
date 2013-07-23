CcProject::Application.routes.draw do
  resources :distance_essentials

  resources :teams


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end
