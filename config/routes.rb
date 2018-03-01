Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "users/registrations"}

  root 'users#home'
  # get 'employees/index'

  # get 'employees/show'

  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :jobs do
    member do
      get :apply_for_job
      get :applied_users
      get :view
      get :cancel_applied
    end
  end
  resources :applied_users



  #  resources :employees


end
