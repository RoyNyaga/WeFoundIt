Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :photos
  resources :comments
end
