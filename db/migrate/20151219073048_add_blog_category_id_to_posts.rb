class AddBlogCategoryIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :blog_category_id, :integer
  end
end
