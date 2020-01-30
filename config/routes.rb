Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/:id/items', to: 'items#index'
        get '/find', to: 'query#show'
        get '/find_all', to: 'query#index'
      end
      resources :merchants, only: [:index, :show]
    end
  end
end
