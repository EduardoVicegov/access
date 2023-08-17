Rails.application.routes.draw do
  devise_for :users

  resources :visitors
  resources :vouchers
  
 root "visitors#index"
end





