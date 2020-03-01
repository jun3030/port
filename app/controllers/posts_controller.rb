class PostsController < ApplicationController
  
  before_action :set_user, only: [:posts_show, :users_posts, :users_create_posts]
  before_action :set_post, only: [:posts_show]
  before_action :all, only: [:users_posts, :users_create_posts]
  
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
    @post = Post.new
    if params[:date]
     @from_mypage_data = Post.new(from_mypage_data: params[:date])
    end
  end
  # 記事を作成
  def users_create_posts

      @post = Post.new(user_id: current_user.id, title: post_params[:title], content: post_params[:content], from_mypage_data: post_params[:from_mypage_data], posts_image: post_params[:posts_image], video: post_params[:video],
                       activity_area: post_params[:activity_area], activity_day: post_params[:activity_day], course_of_action: post_params[:course_of_action],
                       recruitment_gender: post_params[:recruitment_gender], demosound: post_params[:demosound], public_article: post_params[:public_article], 
                       recruitment_part: post_params[:recruitment_part], band_genre: post_params[:band_genre])
      if @post.save(context: :users_create_posts)
        flash[:info] = "記事を作成しました。"
        redirect_to posts_index_url
      else
        render :users_posts
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
    params.require(:post).permit(:title, :content, :from_mypage_data, :video, :posts_image, :activity_day, :course_of_action, :recruitment_gender,:demosound, :public_article,
                                 recruitment_part: [], band_genre: [], activity_area: [])
  end
  
  def all
    @part = ["ボーカル","ギター","ベース","ピアノ・キーボード","ドラム","パーカッション","管楽器","弦楽器","作詞作曲・アレンシャー","ダンサー","その他"]
    @ganre = ["ポップス","ロック","ハードロック・ヘヴィメタル","パンク・メロコア","ハードコア","スラッシュメタル・デスメタル",
              "ビジュアル系","ファンク・ブルース","ジャズ・フュージョン","カントリー・フォーク","スカ・ロカビリー","ソウル",
              "ゴスペル・アカペラ","ボサノバ・ラテン","クラシック","ヒップホップ・レゲエ","ハウス・テクノ","アニソン・ボカロ","その他"]
    @area = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県",
             "茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県",
             "新潟県","富山県","石川県","福井県","山梨県","長野県",
             "岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県",
             "鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県", "沖縄県"]
  end
end
