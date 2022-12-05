# frozen_string_literal: true

Rails.application.routes.draw do

  resources :books, only: %i[index show]
  resources :categories, only: %i[show] do
    resources :books, only: %i[index]
  end
  
  root 'home#index'
end
