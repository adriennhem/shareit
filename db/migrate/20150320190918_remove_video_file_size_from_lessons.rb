class RemoveVideoFileSizeFromLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :video_file_size, :integer
  end
end
