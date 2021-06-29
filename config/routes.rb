# frozen_string_literal: true

Rails.application.routes.draw do
  get '/users/info', to: 'users#info'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :publications, only: %i[index show]

  namespace :admin do
    resources :publications
  end

  post '/create-checkout-session', to: 'sessions#create'

  get '/success', to: 'sessions#success'
end
