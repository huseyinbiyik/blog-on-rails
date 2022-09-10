Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :destroy]
  end
  get "/posts/new", to: "posts#new"
  post "posts/new", to: "posts#create"
  get '/comments/new', to: "comments#new"
  post '/comments/new', to: "comments#create"
  post '/likes/new', to: "likes#create"

end
