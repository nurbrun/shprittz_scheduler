ShprittzScheduler::Application.routes.draw do
  get 'appointments/create'

  get 'condos/new'

  root "pages#home"
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get "/contact", to: "pages#contact", as: "contact"
  post "/emailconfirmation", to: "pages#email", as: "email_confirmation"
  
  
  # devise_for :users
  # devise_for :users, controllers: { resgistrations: "users/registrations" }
  devise_for :users, :controllers => {:registrations => "users/registrations"}


  get "condo/:id", to: "condos#show", as: "condo"

  resources :appointments, only: [:edit, :update, :destroy] 

  resources :condos do
    resources :appointments
  end


  namespace :admin do
    root "base#index"
    resources :users
    resources :condos
  end

end
