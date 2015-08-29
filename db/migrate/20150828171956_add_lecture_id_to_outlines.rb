class AddLectureIdToOutlines < ActiveRecord::Migration
  def change
    add_column :outlines, :lecture_id, :integer
  end
end
