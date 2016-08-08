class ChangeDeadlinefromProjects < ActiveRecord::Migration
  def change
  	change_column :projects, :deadline, :integer
  end
end
