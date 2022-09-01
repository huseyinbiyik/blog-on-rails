Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:user_id/posts", to: "posts#index"
  get "/users/:user_id/posts/:id", to: "posts#show"
  get "/posts/new", to: "posts#new"
  post "posts/new", to: "posts#create"

end
