Rails.application.routes.draw do
  resources :invitations, controller: 'rails_jwt_auth/invitations', only: [:create, :update]
  resource :password, controller: 'rails_jwt_auth/passwords', only: [:create, :update]
  resource :confirmation, controller: 'rails_jwt_auth/confirmations', only: [:create, :update]
  resource :registration, controller: 'rails_jwt_auth/registrations', only: [:create, :update, :destroy]
  resource :session, controller: 'rails_jwt_auth/sessions', only: [:create, :destroy]
  resources :users
  resources :posts
end
