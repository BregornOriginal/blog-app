class AddColumnToCreatePosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :title, :string
    add_column :posts, :text, :text
    add_column :posts, :commentscounter, :integer
    add_column :posts, :likescounter, :integer
  end
end
