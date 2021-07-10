Rails.application.routes.draw do
  #namespace api with versioning
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :create, :destroy]
      resources :orders, only: [:index, :create, :destroy]
    end
  end
end
