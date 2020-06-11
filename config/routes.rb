Rails.application.routes.draw do
  root 'articles#index'

  resources :articles, only: [:new, :create, :index] do
    resources :votes, only: [:create]
  end

  resources :categories, only: [:show]

  devise_for :users, path: '/', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: '' }
end
