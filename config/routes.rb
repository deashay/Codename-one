CodenameOne::Application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users

  resource :world

  resources :races do
    member do
      put :activate
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
