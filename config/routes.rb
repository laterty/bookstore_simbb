Rails.application.routes.draw do
  root 'home#index'
  resource :settings, only: [] do
    resources :addresses, only: :index
    scope module: :addresses do
      resource :billing_address, only: :create
      resource :shipping_address, only: :create
      #post '/billing', to: 'addresses/billing_addresses#create'
      #post '/shipping', to: 'addresses/shipping_addresses#create'
    end
    get 'privacy', to: 'users#edit'
  end
  
  resources :books, only: %i[index show update]

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
end
