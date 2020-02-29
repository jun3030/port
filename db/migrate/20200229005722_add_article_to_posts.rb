class AddArticleToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :public_article, :boolean
    add_column :posts, :article_kind, :string
    add_column :posts, :activity_area, :string
    add_column :posts, :course_of_action, :string
    add_column :posts, :activity_day, :string
    add_column :posts, :recruitment_gender, :string
    add_column :posts, :recruitment_age, :integer
    add_column :posts, :recruitment_part, :string
    add_column :posts, :demosound, :string
    add_column :posts, :band_genre, :string
  end
end
