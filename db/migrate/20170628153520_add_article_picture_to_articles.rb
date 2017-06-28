class AddArticlePictureToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :article_picture, :string
  end
end
