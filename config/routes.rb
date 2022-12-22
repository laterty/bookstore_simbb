# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end

  resources :books, only: %i[index show]
  resources :categories, only: %i[show] do
    resources :books, only: %i[index]
  end

  resource :update_user_email, only: :update
  resource :update_user_password, only: :update
  resource :user, only: %i[edit destroy]
  resource :settings, only: [] do
    resource :address, only: %w[create edit update]
    get 'privacy', to: 'users#edit'
    get 'address', to: redirect('settings/address/edit')
  end

  root 'home#index'

  get 'update_user_email', to: redirect('/user/edit')
  get 'update_user_password', to: redirect('/user/edit')
end
