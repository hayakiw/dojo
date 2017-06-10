Rails.application.routes.draw do
  resources :customers
  get 'home/index'

  devise_for :accounts, :controllers => { :registrations => 'accounts/registrations' }

  devise_scope :account do
    get 'accounts', to: 'accounts/registrations#index'
    get 'accounts/new', to: 'accounts/registrations#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
