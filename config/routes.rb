Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/index'

  devise_for :users, :controllers => { registrations: 'registrations' }

  namespace :user do
    resources :articles
  end

  resources :articles
end
