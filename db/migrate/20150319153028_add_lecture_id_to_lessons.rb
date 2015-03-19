class AddLectureIdToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :lecture_id, :integer
  end
end
