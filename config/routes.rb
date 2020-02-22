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
  patch 'users/:id/upload_instagram', to: 'users#upload_instagram', as: :upload_instagram # instagram アップロード
  get 'users/:id/edit_picture', to: 'users#edit_picture', as: :edit_picture # 画像編集
  patch 'users/:id/update_picture', to: 'users#update_picture', as: :update_picture # 画像アップロード
  
  resources :users do
     
    get 'posts/:id/posts_show', to: 'posts#posts_show', as: :posts_show # モーダルウィンドウ
    get 'posts/users_posts', to: 'posts#users_posts', as: :posts #　記事を投稿するページ
    post 'posts/users_create_posts', to: 'posts#users_create_posts', as: :create_posts #　記事を作る
    
    get 'urls/add_mypage_content', to: 'urls#add_mypage_content', as: :add_mypage_content # マイページへ写真、動画をアップロードする為のページ
    post 'urls/add_mypage_content_create', to: 'urls#add_mypage_content_create', as: :add_mypage_content_create # マイページへ写真、動画をアップロードする
    
    patch 'urls/:id/users_imaeg_and_video_url', to: 'urls#users_imaeg_and_video_url', as: :users_url
  end
 
 
end
