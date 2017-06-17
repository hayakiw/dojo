Rails.application.routes.draw do

  get 'home/index'

  devise_for :accounts, :controllers => { :registrations => 'accounts/registrations', :sessions => 'accounts/sessions' }

    # get 'accounts/index'
    #
    # get 'accounts/new'
    #
    # get 'accounts/create'
    #
    # get 'accounts/edit'
    #
    # get 'accounts/update'
    #
    # get 'accounts/destroy'
  # devise_scope :account do
  #   get 'accounts', to: 'accounts/registrations#index'
  #   get 'accounts/new', to: 'accounts/registrations#new'
  # resources :accounts
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :admins do
    resources :customers, except: [:show]
    resources :accounts, except: [:show]
  end
end
