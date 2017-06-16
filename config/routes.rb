Rails.application.routes.draw do

  root "links#index"
  get "/signin",        to: "sessions#new",     as: "signin" #signin_path/url
  post "/signin",       to: "sessions#create"
  get "/signup",        to: "users#new",        as: "signup" #signup_path/url
  resources :users
  resources :links
  # redirect back to root_path if bad GET request is made
  get '*a' => redirect { |p, req| req.flash[:danger] = "Ah snap! Hitmunk couldn't find that page."; '/' }
end
