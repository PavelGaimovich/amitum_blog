class CategoriesAddUrlSlug < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :url_slug, :string
  end
end
