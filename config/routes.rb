Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "missing_items#index"
  resources :missing_items do
    collection do
      get :search
    end

    member do
      get :toggle_status
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :photos
  resources :comments
end
