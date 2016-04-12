Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/merchants/find", to: "merchants#show"

      resources :merchants

      get "/customers/find", to: "customers#show"
      resources :customers

      get "/items/find", to: "items#show"
      resources :items

      get "/invoices/find", to: "invoices#show"
      resources :invoices

      get "/invoice_items/find", to: "invoice_items#show"
      resources :invoice_items

      get "/transactions/find", to: "transactions#show"
      resources :transactions
    end
  end
end
