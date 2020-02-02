Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'query#show'
        get '/find_all', to: 'query#index'
        get '/random', to: 'random#show'
        get '/:id/items', to: 'items#index'
        get '/:id/invoices', to: 'invoices#index'
        get '/revenue', to: 'revenue#show'
        get '/most_revenue', to: 'revenue#index'
        get '/:id/favorite_customer', to: 'customers#show'
      end
      resources :merchants, only: [:index, :show]

      namespace :customers do
        get '/find', to: 'query#show'
        get '/find_all', to: 'query#index'
        get '/random', to: 'random#show'
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/favorite_merchant', to: 'merchants#show'
      end
      resources :customers, only: [:index, :show]

      namespace :items do
        get '/find', to: 'query#show'
        get '/find_all', to: 'query#index'
        get '/random', to: 'random#show'
      end
      resources :items, only: [:index, :show]
    end
  end
end
