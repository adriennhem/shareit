class RemoveLessonVideoFromLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :lesson_video, :text
  end
end
