class AddLectureVideoToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :lecture_video, :text
  end
end
