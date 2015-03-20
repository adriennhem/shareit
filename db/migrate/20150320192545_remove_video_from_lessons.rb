class RemoveVideoFromLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :video, :text
  end
end
