Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users do
    member do
      patch 'update_labels'
    end
  end
  resources :labels
end
