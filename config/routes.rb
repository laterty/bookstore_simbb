# frozen_string_literal: true

Rails.application.routes.draw do
  get 'carts/show'
  resources :books, only: %i[index show] do
    resource :review, only: %i[create]
  end
  resources :categories, only: %i[show] do
    resources :books, only: %i[index]
  end
  resources :line_items, only: %i[create show destroy]
  
  resource :order
  resource :checkout_address, only: %i[new create]
  resource :checkout_login, only: %i[show]
  resource :coupon, only: %i[update]
  resource :update_user_email, only: :update
  resource :update_user_password, only: :update
  resource :user, only: %i[edit destroy]
  resource :settings, only: [] do
    resource :address, only: %w[create edit update]
    get 'privacy', to: 'users#edit'
    get 'address', to: redirect('settings/address/edit')
  end
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
  
  root 'home#index'

  get 'update_user_email', to: redirect('/user/edit')
  get 'update_user_password', to: redirect('/user/edit')

  get 'carts/:id', to: "carts#show", as: "cart"

  post 'line_items/:id/add', to: "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce', to: "line_items#reduce_quantity", as: "line_item_reduce"
end
