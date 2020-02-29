class PostsController < ApplicationController
  
  before_action :set_user, only: [:posts_show, :users_posts, :users_create_posts]
  before_action :set_post, only: [:posts_show]
  
  def index
    @users = User.all
    @posts = Post.all
  end
  # モーダルウィンドウ
  def posts_show
    @post = Post.find(params["id"])
    @user = User.find(params["user_id"])
  end
  # 記事投稿画面
  def users_posts
    @part = ["ボーカル","ギター","ベース","ピアノ・キーボード","ドラム","パーカッション","管楽器","弦楽器","作詞作曲・アレンシャー","ダンサー","その他"]
    @ganre = ["ポップス","ロック","ハードロック・ヘヴィメタル","パンク・メロコア","ハードコア","スラッシュメタル・デスメタル",
              "ビジュアル系","ファンク・ブルース","ジャズ・フュージョン","カントリー・フォーク","スカ・ロカビリー","ソウル",
              "ゴスペル・アカペラ","ボサノバ・ラテン","クラシック","ヒップホップ・レゲエ","ハウス・テクノ","アニソン・ボカロ","その他"]
    @post = Post.new
    if params[:date]
     @from_mypage_data = Post.new(from_mypage_data: params[:date])
    end
  end
  # 記事を作成
  def users_create_posts
    
    if params[:date]
     if params[:post][:from_mypage_data].present? && (params[:post][:posts_image].blank? && params[:post][:video].blank?)
      @post = Post.new(user_id: current_user.id, title: post_params[:title], content: post_params[:content], from_mypage_data: post_params[:from_mypage_data], 
                       activity_area: post_params[:activity_area], activity_day: post_params[:activity_day], course_of_action: post_params[:course_of_action],
                       recruitment_gender: post_params[:recruitment_gender], demosound: post_params[:demosound], public_article: post_params[:public_article], 
                       recruitment_part: post_params[:recruitment_part], band_genre: post_params[:band_genre])
      @post.save(context: :users_create_posts)
      redirect_to user_posts_url
     end
    else
    if params[:post][:title].blank? || params[:post][:content].blank?
     flash[:danger] = "記事タイトルと記事内容を入力して下さい"
     redirect_to user_posts_url
    else
      if params[:post][:from_mypage_data] && (params[:post][:posts_image].blank? && params[:post][:video].blank?)
         @post = Post.new(user_id: current_user.id, title: post_params[:title], content: post_params[:content], from_mypage_data: post_params[:from_mypage_data],
                          activity_area: post_params[:activity_area], activity_day: post_params[:activity_day], course_of_action: post_params[:course_of_action],
                          recruitment_gender: post_params[:recruitment_gender], demosound: post_params[:demosound], public_article: post_params[:public_article], 
                          recruitment_part: post_params[:recruitment_part], band_genre: post_params[:band_genre])
         @post.save(context: :users_create_posts)
         flash[:success] = "記事を投稿しました。"
         redirect_to posts_index_url
      elsif params[:post][:from_mypage_data] && (params[:post][:posts_image].present? || params[:post][:video].present?)
         flash[:success] = "マイページから投稿する場合は画像ファイルと動画は選択しないでください"
         redirect_to posts_index_url
      else
        if params[:post][:posts_image].present? && params[:post][:video].present? 
          flash[:danger] = "画像か動画どちらか一つを投稿して下さい。"
          redirect_to  user_posts_url
        elsif params[:post][:posts_image].blank? && params[:post][:video].blank?
          flash[:danger] = "画像か動画どちらか一つを投稿して下さい。"
          redirect_to  user_posts_url
        else
          @post = Post.new(user_id: current_user.id, title: post_params[:title], content: post_params[:content], video: post_params[:video], posts_image: post_params[:posts_image],
                           activity_area: post_params[:activity_area], activity_day: post_params[:activity_day], course_of_action: post_params[:course_of_action],
                           recruitment_gender: post_params[:recruitment_gender], demosound: post_params[:demosound], public_article: post_params[:public_article], 
                           recruitment_part: post_params[:recruitment_part], band_genre: post_params[:band_genre])
          @post[:video] = params[:post][:video]
          if @post.save(context: :users_create_posts)
            flash[:success] = "記事を投稿しました。"
            redirect_to posts_index_url
          else
            flash[:danger] = "作成に失敗しました。"
            render :index
          end
        end
      end
    end
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :content, :from_mypage_data, :video, :posts_image, :activity_area, :activity_day, :course_of_action, :recruitment_gender,:demosound, :public_article,
                                 recruitment_part: [], band_genre: [])
  end
end
