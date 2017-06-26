Rails.application.routes.draw do
  resources :articles
  root to: 'home#index'
  get 'home/index'

  devise_for :users, :controllers => { registrations: 'registrations' }
end
