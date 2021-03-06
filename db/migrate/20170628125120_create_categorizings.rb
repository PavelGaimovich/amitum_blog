class CreateCategorizings < ActiveRecord::Migration[5.1]
  def change
    create_table :categorizings do |t|
      t.belongs_to :article, foreign_key: true
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
