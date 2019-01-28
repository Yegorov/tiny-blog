# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get 'page/:page', to: 'home#index'
  resources :pages, only: %i[index show]
  resources :posts, only: %i[show] do
    #get 'page/:page', action: :index, on: :collection
  end

  get 'contact', to: 'static_page#contact'
end
