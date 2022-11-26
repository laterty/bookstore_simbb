# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }

  resource :settings, only: [] do
    resource :address, only: %w[create edit]
    get 'privacy', to: 'users#edit'
    get 'address', to: redirect('settings/address/edit')
  end
  
  resources :books, only: %I[index show]
  resources :categories, only: %I[show] do
    resources :books, only: %I[index]
  end
  root 'home#index'

  resource :update_user_email, only: :update
  resource :update_user_password, only: :update
  resource :user, only: %i[edit destroy]

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end

  # CHECK: to avoid app error when refresh forms page after failing validation:
  # alternative way: https://fullstackheroes.com/tutorials/rails/wrong-url-validation-error/
  get 'update_user_email', to: redirect('/user/edit')
  get 'update_user_password', to: redirect('/user/edit')
end
