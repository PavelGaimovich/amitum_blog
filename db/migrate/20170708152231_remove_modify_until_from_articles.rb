class RemoveModifyUntilFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :modify_until
  end
end
