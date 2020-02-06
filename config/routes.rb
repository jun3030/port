Rails.application.routes.draw do

  root 'home#top'
   # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
 
  get 'posts/index'
  
  get 'users/:id/edit_profile', to: 'users#edit_profile', as: :users_profile # プロフィール設定画面
  patch 'users/:id/update_profile', to: 'users#update_profile', as: :update_profile # プロフィール アップデート
  get 'users/:id/edit_mypage', to: 'users#edit_mypage', as: :edit_mypage # マイページ
  patch 'users/:id/update_mypage', to: 'users#update_mypage', as: :update_mypage # マイページ アップデート
  get 'users/:id/edit_picture', to: 'users#edit_picture', as: :edit_picture # 画像編集
  patch 'users/:id/update_picture', to: 'users#update_picture', as: :update_picture # 画像アップロード
  
  resources :users do
     
    get 'posts/:id/posts_show', to: 'posts#posts_show', as: :posts_show # モーダルウィンドウ
    get 'posts/users_posts', to: 'posts#users_posts', as: :posts #　記事を投稿するページ
  end
 
 
end
