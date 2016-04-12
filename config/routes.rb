Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/merchants/find", to: "merchants#show"
      get "/merchants/find_all", to: "merchants#index"

      resources :merchants

      get "/customers/find", to: "customers#show"
      get "/customers/find_all", to: "customers#index"
      resources :customers

      get "/items/find", to: "items#show"
      get "/items/find_all", to: "items#index"
      resources :items

      get "/invoices/find", to: "invoices#show"
      get "/invoices/find_all", to: "invoices#index"
      resources :invoices

      get "/invoice_items/find", to: "invoice_items#show"
      get "/invoice_items/find_all", to: "invoice_items#index"
      resources :invoice_items

      get "/transactions/find", to: "transactions#show"
      get "/transactions/find_all", to: "transactions#index"
      resources :transactions
    end
  end
end
