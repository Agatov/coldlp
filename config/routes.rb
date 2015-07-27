Rails.application.routes.draw do


  root to: "landings#show"


  namespace :admin do
    resources :orders, only: :index
    resources :contacts do
      resources :comments, only: [:create, :destroy]
    end
  end

  resources :orders, only: :create
  resource :landing, only: :show
end
