Rails.application.routes.draw do

  get 'home/index'

  devise_for :accounts, :controllers => { :registrations => 'accounts/registrations', :sessions => 'accounts/sessions' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :admins do
    resources :accounts, except: [:show]
  end

  resources :customers, except: [:show] do
    resources :customer_projects, only: [:show]
  end

  namespace :customers do
    resources :customer_projects, except: [:show]
  end
end
