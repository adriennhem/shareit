class RemoveCourseidFromProjects < ActiveRecord::Migration
  def change
  	remove_column :projects, :course_id
  end
end
