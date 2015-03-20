class AddLessonVideoToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :lesson_video, :text
  end
end
