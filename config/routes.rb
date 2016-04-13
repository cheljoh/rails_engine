Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/merchants/find", to: "merchants#show"
      get "/merchants/random", to: "random_merchants#show"
      get "/merchants/find_all", to: "merchants#index"
      get "/merchants/find_all", to: "merchants#index"
      resources :merchants, only: [:index, :show] do
        resources :items, only: [:index]
        resources :invoices, only: [:index]
      end

      get "/customers/find", to: "customers#show"
      get "/customers/find_all", to: "customers#index"
      get "/customers/random", to: "random_customers#show"
      resources :customers, only: [:index, :show]

      get "/items/find", to: "items#show"
      get "/items/find_all", to: "items#index"
      get "/items/random", to: "random_items#show"
      resources :items, only: [:index, :show]

      get "/invoices/find", to: "invoices#show"
      get "/invoices/find_all", to: "invoices#index"
      get "/invoices/random", to: "random_invoices#show"
      resources :invoices, only: [:index, :show] do
        resources :transactions,  only: [:index]
        resources :invoice_items,  only: [:index]
        get '/items', to: 'invoices/items#index'
        get '/customer', to: "invoices/customers#show"
        get '/merchant', to: "invoices/merchants#show"
      end

      get "/invoice_items/find", to: "invoice_items#show"
      get "/invoice_items/find_all", to: "invoice_items#index"
      get "/invoice_items/random", to: "random_invoice_items#show"
      resources :invoice_items, only: [:index, :show]

      get "/transactions/find", to: "transactions#show"
      get "/transactions/find_all", to: "transactions#index"
      get "/transactions/random", to: "random_transactions#show"
      resources :transactions, only: [:index, :show]
    end
  end
end
