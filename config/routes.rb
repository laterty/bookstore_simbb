Rails.application.routes.draw do
  root 'home#index'
  get 'settings/addresses', to: 'addresses#index'
  get 'settings/privacy', to: 'users#edit'
  post 'settings/addresses', to: 'addresses#create'
  resources :books, only: %i(index show update)

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end

end
