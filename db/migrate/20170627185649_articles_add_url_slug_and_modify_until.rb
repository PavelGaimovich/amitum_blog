class ArticlesAddUrlSlugAndModifyUntil < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :url_slug, :string
    add_column :articles, :modify_until, :datetime
  end
end
