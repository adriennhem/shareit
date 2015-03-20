class AddVideoToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :video, :text
  end
end
