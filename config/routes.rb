Rails.application.routes.draw do
  root 'home#top'
  
  get 'posts/index'
  resources :users do
  end
  
  get 'users/:id/edit_profile', to: 'users#edit_profile', as: :users_profile
  patch 'users/:id/update_profile', to: 'users#update_profile', as: :update_profile
 
end
