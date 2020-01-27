Rails.application.routes.draw do

  root 'home#top'
   # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
 
  get 'posts/index'
  
  get 'users/:id/edit_profile', to: 'users#edit_profile', as: :users_profile
  patch 'users/:id/update_profile', to: 'users#update_profile', as: :update_profile
  
  resources :users do
  end
 
 
end
