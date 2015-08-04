Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :bands, only: [:new, :create, :show, :destroy]
end
