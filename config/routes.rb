Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :index, :create, :destroy, :show ]
      resources :contracts, only: [ :create, :index, :show, :update ]
      resources :subscriptions, only: [ :create ]
      resources :contract_options, only: [ :create ]
    end
  end

  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
