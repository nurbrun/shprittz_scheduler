ShprittzScheduler::Application.routes.draw do
  get 'condos/new'

  root "pages#home"
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get "/contact", to: "pages#contact", as: "contact"
  post "/emailconfirmation", to: "pages#email", as: "email_confirmation"
  
  
  # devise_for :users
  # devise_for :users, controllers: { resgistrations: "users/registrations" }
  devise_for :users, :controllers => {:registrations => "users/registrations"}


  namespace :admin do
    root "base#index"
    resources :users
    resources :condos
  end

end
