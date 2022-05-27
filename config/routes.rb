Rails.application.routes.draw do
  root to: 'Products#index'
  resources :products do
    resources :reviews
  end
end
