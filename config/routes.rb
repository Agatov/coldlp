Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


  root to: "landings#show"


  namespace :admin do
    resources :orders, only: [:index, :destroy]
    resources :contacts do
      resources :comments, only: [:create, :destroy]
    end
  end

  resources :orders, only: :create
  resource :landing, only: :show
end
