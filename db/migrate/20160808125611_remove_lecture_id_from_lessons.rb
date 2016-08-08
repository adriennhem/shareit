class RemoveLectureIdFromLessons < ActiveRecord::Migration
  def change
  	remove_column :lessons, :lecture_id
  	remove_column :projects, :project_context
  	remove_column :projects, :estimated_duration
  end
end
