Rails.application.routes.draw do
  root 'home#index'
  resource :settings, only: [] do
    resource :address, only: %w[update create edit]
    get 'privacy', to: 'users#edit'
  end

  resources :books, only: %i[index show update]
  resource :update_user_email, only: :update
  resource :update_user_password, only: :update
  resource :user, only: %i[edit destroy]

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
end
