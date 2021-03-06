Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #  welcome page to the root of my app

  root :to            =>    "welcome#index"


    # users:
  get     "/users"             =>  "users#index",     as: "users"

  # sign up:
  get     "/signup"            =>  "users#new",       as: "new_user"
  post    "/users"             =>  "users#create"

  # show, edit, update, destroy:
  get     "/users/:id"         =>  "users#show",      as: "user"
  get     "/users/:id/edit"    =>  "users#edit",      as: "edit_user"
  put     "/users/:id"         =>  "users#update"
  patch   "/users/:id"         =>  "users#update"
  delete  "/users/:id"         =>  "users#destroy"

  # login
  get     "/login"              =>  "users#login_form"
  post    "/login"              =>  "users#create_login"

  # logout
  get     "/logout"             =>  "users#logout"


    resources :posts
    resources :comments

  end
