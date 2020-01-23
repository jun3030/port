Rails.application.routes.draw do
  root 'home#top'
  
  get 'posts/index'
  
  resources :users do
    patch 'posts/:id/edit_profile', to: 'posts#edit_profile', as: :edit_profile
  end
  
  get 'users/:id/profile', to: 'users#profile', as: :users_profile
 
end
