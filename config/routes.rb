Rails.application.routes.draw do
  get 'addresses/index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }

  resources :books
  root 'home#index'

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
end
