class AddCategoryIdToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :category_id, :integer
  end
end
