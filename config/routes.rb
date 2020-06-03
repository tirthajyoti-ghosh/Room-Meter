Rails.application.routes.draw do
  root 'articles#index'

  get '/articles', to: 'articles#index'

  get 'articles/new', to: 'articles#new'

  post '/articles', to: 'articles#create'

  devise_for :users, path: '/', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: '' }
end
