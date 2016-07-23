class RemoveTeacherDescriptionFromLectures < ActiveRecord::Migration
  def change
    remove_column :lectures, :teacher_description, :string
  end
end
