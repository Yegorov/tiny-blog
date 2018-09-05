Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :pages, only: [:index, :show]
  resources :posts, only: [:show]

  get 'contact', to: "static_page#contact"
end
