# frozen_string_literal: true

Rails.application.routes.draw do

  resources :books, only: %i[index show]
  resources :categories, only: %i[show] do
    resources :books, only: %i[index]
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
