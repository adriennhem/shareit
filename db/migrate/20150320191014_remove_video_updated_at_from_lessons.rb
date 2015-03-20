class RemoveVideoUpdatedAtFromLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :video_updated_at, :string
  end
end
