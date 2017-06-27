class ArticlesAddViewsCount < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :views_count, :decimal, default: 0
  end
end
