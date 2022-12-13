# frozen_string_literal: true

Rails.application.routes.draw do
  get 'carts/show'
  resources :books, only: %i[index show] do
    resource :review, only: %i[create]
  end
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
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
  
  root 'home#index'


  get 'update_user_email', to: redirect('/user/edit')
  get 'update_user_password', to: redirect('/user/edit')

  get 'carts/:id', to: "carts#show", as: "cart"

  post 'line_items/:id/add', to: "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce', to: "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items', to: "line_items#create"
  get 'line_items/:id', to: "line_items#show", as: "line_item"
  delete 'line_items/:id', to: "line_items#destroy"

  resources :orders
end
