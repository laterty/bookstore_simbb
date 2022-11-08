Rails.application.routes.draw do
  root 'home#index'
  resource :settings, only: [] do
    resource :address, only: %w[update create edit]
    get 'privacy', to: 'users#edit'
  end

  resources :books, only: %i[index show update]
  recource :update_user_email, only: %i[update]
  recource :update_user_password, only: %i[update]

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
end
