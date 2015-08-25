class AddLectureIdToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :lecture_id, :integer
    add_index :chapters, :lecture_id
  end
end
