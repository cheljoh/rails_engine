Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :merchants
      resources :customers
      resources :items
      resources :invoices
      resources :invoice_items
      resources :transactions
    end
  end
end
