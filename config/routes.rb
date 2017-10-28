Rails.application.routes.draw do

  get 'home/index'

  # devise_for :accounts, :controllers => { :registrations => 'accounts/registrations', :sessions => 'accounts/sessions' }
  devise_for :accounts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :admins do
    resources :accounts, except: [:show]
  end

  resources :customers, except: [:show], shallow: true do
    resources :customer_projects, except: [:show], shallow: true do
      resources :customer_project_works, only:[:new, :edit, :update, :create]
    end
  end

  # resources :working_report
  get    'working_report(/:report_at)', to: 'working_report#index', as: 'working_report_index'
  get    'working_report_get_projects', to: 'working_report#get_projects', as: 'working_report_get_projects'

  # namespace :customers do
  #   resources :customer_projects, except: [:show, :index]
  # end
end
