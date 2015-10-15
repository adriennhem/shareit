class AddLectureIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :lecture_id, :integer
  end
end
