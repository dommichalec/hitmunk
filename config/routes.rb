Rails.application.routes.draw do

  root "links#index"
  get "/signup",        to: "users#new",        as: "signup" #signup_path/url
  resources :users
  resources :links
  # redirect back to root_path if bad GET request is made
  get '*a' => redirect { |p, req| req.flash[:danger] = "Ah snap! Hitmunk couldn't find that page."; '/' }
end
