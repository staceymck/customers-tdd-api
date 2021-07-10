Rails.application.routes.draw do
  #namespace api with versioning
  namespace :api do
    namespace :v1 do
      resources :customers, except: [:show, :new]
    end
  end
end
