class AddPermalinkToBlogCategories < ActiveRecord::Migration
  def change
    add_column :blog_categories, :permalink, :string
  end
end
