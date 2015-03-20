class RemoveLectureVideoFromLectures < ActiveRecord::Migration
  def change
    remove_column :lectures, :lecture_video, :text
  end
end
