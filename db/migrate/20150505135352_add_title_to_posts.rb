class AddTitleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
    add_column :posts, :author, :string
    add_column :posts, :content, :text
  end
end
