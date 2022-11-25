# frozen_string_literal: true

Rails.application.routes.draw do
  resources :books, only: %I[index show]
  resources :categories, only: %I[show] do
    resources :books, only: %I[index]
  end
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }
  root 'home#index'

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
end
