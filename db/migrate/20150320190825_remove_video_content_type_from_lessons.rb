class RemoveVideoContentTypeFromLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :video_content_type, :string
  end
end
