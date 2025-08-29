Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  constraints host: "brand-admin.intern-admin.e-gift.co" do
    namespace :admins, path: nil do
      root "top#index"
      resources :sessions, only: [ :new, :create, :destroy ]
      resources :items do
        member do
        put :status
        end
      end
    end
  end

  constraints host: /\A[a-z0-9-]+\.intern-giftee\.e-gift\.co\z/ do
    namespace :egift_stores, path: nil do
      root "top#index"
      resources :orders, only: [ :new, :create, :show ]
    end

    namespace :egifts, path: nil do
      resources :tickets, only: [ :show ], param: :public_key
    end
  end

  match "*path", to: "errors#not_found", via: :all, constraints: ->(req) { req.format.html? }
end
