Rails.application.routes.draw do

  root to: "articles#index"

  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy", as: "destroy_user"

  get "/login", to: "sessions#new", as: "new_session"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create", as: "create_session"

  get "/munis/:id", to: "munis#show", as: "muni"

  get "/articles/new", to: "articles#new", as: "new_article"
  post "/articles", to: "articles#create"
  get "/articles/:id", to: "articles#show", as: "article"
  get "/articles/:id/edit", to: "articles#edit", as: "edit_article"
  patch "/articles/:article_id", to: "articles#update"
  delete "/articles/:id", to: "articles#destroy", as: "destroy_article"

  patch "/comments/:id", to: "comments#update"

  get "*unmatched_route", to: "application#not_found"
end
