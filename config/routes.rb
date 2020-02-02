Rails.application.routes.draw do

  root 'home#top'
   # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
 
  get 'posts/index'
  
  get 'users/:id/edit_profile', to: 'users#edit_profile', as: :users_profile
  patch 'users/:id/update_profile', to: 'users#update_profile', as: :update_profile
  get 'users/:id/edit_mypage', to: 'users#edit_mypage', as: :edit_mypage
  patch 'users/:id/update_mypage', to: 'users#update_mypage', as: :update_mypage
  get 'users/:id/edit_picture', to: 'users#edit_picture', as: :edit_picture
  patch 'users/:id/update_picture', to: 'users#update_picture', as: :update_picture
  resources :users do
     member do
      get 'edit_basic_info'
      patch 'update_basic_info'
    end
    get 'posts/:id/posts_show', to: 'posts#posts_show', as: :posts_show
  end
 
 
end
