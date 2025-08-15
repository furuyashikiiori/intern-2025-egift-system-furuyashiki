Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :admins do
    root "top#index"
    resources :sessions, only: [ :new, :create, :destroy ]
    resources :items
  end

  namespace :egift_stores do
    root "top#index"
    resources :orders, only: [ :new, :create, :show ]
  end

  namespace :egifts do
    resources :tickets, only: [ :show ], param: :public_key
  end
end
