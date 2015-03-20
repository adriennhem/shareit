class RemoveVideoFileNameFromLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :video_file_name, :text
  end
end
