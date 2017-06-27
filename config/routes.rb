Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  root "links#index"
  delete "/signout",    to: "sessions#destroy",  as:   "signout" #signout_path/url
  get "/signin",        to: "sessions#new",     as:   "signin"  #signin_path/url
  post "/signin",       to: "sessions#create"
  get "/signup",        to: "users#new",        as:   "signup"  #signup_path/url

  resources :users
  resources :links do
    resources :comments, module: :links
  end
  resources :questions do
    resources :comments, module: :questions
  end
  resources :upvotes
  resources :conversations do
    resources :messages

    collection do
      get :inbox
      get :all, action: :index
      get :sent
      get :trash
    end
  end
  # redirect back to root_path if bad GET request is made
  get '*a' => redirect { |p, req| req.flash[:danger] = "Ah snap! Hitmunk couldn't find that page."; '/' }
end
