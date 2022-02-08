Rails.application.routes.draw do
  root to: 'carts#index'
  resources :carts do
    collection { post :import }
  end
end
