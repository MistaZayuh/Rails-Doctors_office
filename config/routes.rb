Rails.application.routes.draw do
  root "appointments#index"

  resources :doctors do
    resources :appointments, only: [:index, :new, :create, :destroy]
  end
  resources :users
end
