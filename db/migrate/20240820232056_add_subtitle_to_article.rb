class AddSubtitleToArticle < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :subtitle, :string
  end
end
