# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :pages, only: %i[index show]
  resources :posts, only: %i[show]

  get 'contact', to: 'static_page#contact'
end
