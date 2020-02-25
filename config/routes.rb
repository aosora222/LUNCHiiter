Rails.application.routes.draw do
  devise_for :users
  root to: 'lunches#index'

  resources :lunches do
    collection do
      get 'confirm'
    end
  end
end
