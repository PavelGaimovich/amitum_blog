Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'home#index'
  get 'home/index'

  devise_for :users, :controllers => { registrations: 'registrations' }

  namespace :user do
    resources :articles
  end

  resources :articles
  resources :categories, only: [:show]
end
