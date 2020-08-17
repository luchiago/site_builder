require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sites, only: %i[create]
    end
  end
  mount Sidekiq::Web => '/sidekiq'
end
