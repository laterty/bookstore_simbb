# frozen_string_literal: true

Rails.application.routes.draw do

  resources :books, only: %I[index show]
  resources :categories, only: %I[show] do
    resources :books, only: %I[index]
  end
  
  root 'home#index'
end
